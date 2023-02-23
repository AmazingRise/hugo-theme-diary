var debounce = function (func, wait, options) {
  let lastArgs, lastThis, maxWait, result, timerId, lastCallTime;

  let lastInvokeTime = 0;
  let leading = false;
  let maxing = false;
  let trailing = true;

  // Bypass `requestAnimationFrame` by explicitly setting `wait=0`.
  const useRAF =
    !wait && wait !== 0 && typeof root.requestAnimationFrame === "function";

  if (typeof func !== "function") {
    throw new TypeError("Expected a function");
  }
  function isObject(value) {
    const type = typeof value;
    return value != null && (type === "object" || type === "function");
  }

  wait = +wait || 0;
  if (isObject(options)) {
    leading = !!options.leading;
    maxing = "maxWait" in options;
    maxWait = maxing ? Math.max(+options.maxWait || 0, wait) : maxWait;
    trailing = "trailing" in options ? !!options.trailing : trailing;
  }

  function invokeFunc(time) {
    const args = lastArgs;
    const thisArg = lastThis;

    lastArgs = lastThis = undefined;
    lastInvokeTime = time;
    result = func.apply(thisArg, args);
    return result;
  }

  function startTimer(pendingFunc, wait) {
    if (useRAF) {
      root.cancelAnimationFrame(timerId);
      return root.requestAnimationFrame(pendingFunc);
    }
    return setTimeout(pendingFunc, wait);
  }

  function cancelTimer(id) {
    if (useRAF) {
      return root.cancelAnimationFrame(id);
    }
    clearTimeout(id);
  }

  function leadingEdge(time) {
    // Reset any `maxWait` timer.
    lastInvokeTime = time;
    // Start the timer for the trailing edge.
    timerId = startTimer(timerExpired, wait);
    // Invoke the leading edge.
    return leading ? invokeFunc(time) : result;
  }

  function remainingWait(time) {
    const timeSinceLastCall = time - lastCallTime;
    const timeSinceLastInvoke = time - lastInvokeTime;
    const timeWaiting = wait - timeSinceLastCall;

    return maxing
      ? Math.min(timeWaiting, maxWait - timeSinceLastInvoke)
      : timeWaiting;
  }

  function shouldInvoke(time) {
    const timeSinceLastCall = time - lastCallTime;
    const timeSinceLastInvoke = time - lastInvokeTime;

    // Either this is the first call, activity has stopped and we're at the
    // trailing edge, the system time has gone backwards and we're treating
    // it as the trailing edge, or we've hit the `maxWait` limit.
    return (
      lastCallTime === undefined ||
      timeSinceLastCall >= wait ||
      timeSinceLastCall < 0 ||
      (maxing && timeSinceLastInvoke >= maxWait)
    );
  }

  function timerExpired() {
    const time = Date.now();
    if (shouldInvoke(time)) {
      return trailingEdge(time);
    }
    // Restart the timer.
    timerId = startTimer(timerExpired, remainingWait(time));
  }

  function trailingEdge(time) {
    timerId = undefined;

    // Only invoke if we have `lastArgs` which means `func` has been
    // debounced at least once.
    if (trailing && lastArgs) {
      return invokeFunc(time);
    }
    lastArgs = lastThis = undefined;
    return result;
  }

  function cancel() {
    if (timerId !== undefined) {
      cancelTimer(timerId);
    }
    lastInvokeTime = 0;
    lastArgs = lastCallTime = lastThis = timerId = undefined;
  }

  function flush() {
    return timerId === undefined ? result : trailingEdge(Date.now());
  }

  function pending() {
    return timerId !== undefined;
  }

  function debounced(...args) {
    const time = Date.now();
    const isInvoking = shouldInvoke(time);

    lastArgs = args;
    lastThis = this;
    lastCallTime = time;

    if (isInvoking) {
      if (timerId === undefined) {
        return leadingEdge(lastCallTime);
      }
      if (maxing) {
        // Handle invocations in a tight loop.
        timerId = startTimer(timerExpired, wait);
        return invokeFunc(lastCallTime);
      }
    }
    if (timerId === undefined) {
      timerId = startTimer(timerExpired, wait);
    }
    return result;
  }
  debounced.cancel = cancel;
  debounced.flush = flush;
  debounced.pending = pending;
  return debounced;
};

const navBar = document.getElementById("navBar");
const navBackground = document.getElementById("navBackground");
const navTitle = document.getElementById("navTitle");
const extraContainer = document.getElementById("extraContainer");
const streamContainer = document.getElementById("streamContainer");

// Scroll

var sgn = function (t, x) {
  let k = 1 / (1 - 2 * t);
  if (x <= t) return 0;
  else if (x >= 1 - t) return 1;
  else {
    return k * (x - t);
  }
};

var handleScroll = function () {
  //let scrollY = window.scrollY;
  let pageHeadHeight = function () {
    return document.getElementById("pageHead").offsetHeight;
  };

  let navBarHeight = function () {
    return document.getElementById("navBar").offsetHeight;
  };
  let navOpacity = sgn(
    0.0,
    Math.min(
      1,
      Math.max(0, window.scrollY / (pageHeadHeight() - navBarHeight() * 0.8))
    )
  );
  if (navOpacity >= 1) {
    navBackground.style.opacity = 1;
    navTitle.style.opacity = 1;
  } else {
    navBackground.style.opacity = 0;
    navTitle.style.opacity = 0;
  }

  if (typeof spy !== "undefined") {
    spy();
  }
};

window.addEventListener(
  "scroll",
  debounce(handleScroll, 100, { maxWait: 100 }),
  false
);

document.querySelectorAll("table").forEach(function (elem) {
  elem.classList.add("table-striped");
  elem.classList.add("table");
  elem.classList.add("table-responsive");
  elem.classList.add("table-hover");
});

// Night mode

var isDarkMode = false;

var toggleDarkMode = function () {
  let setGiscusTheme = function (themeName) {
    const iframe = document.querySelector('iframe.giscus-frame');
    if (!iframe) return;
    iframe.contentWindow.postMessage({
      giscus: {
        setConfig: {
          theme: themeName
        }
      }
    }, '*');
  }

  isDarkMode = !isDarkMode;
  let icon = document.getElementById("darkModeToggleIcon");
  let icon2 = document.getElementById("darkModeToggleIcon2");
  if (isDarkMode == true) {
    document.cookie = "night=1;path=/";
    document.body.classList.add("night");
    icon.innerText = "light_mode";
    icon2.innerText = "light_mode";
    setGiscusTheme("dark");
  } else {
    document.cookie = "night=0;path=/";
    document.body.classList.remove("night");
    icon.innerText = "dark_mode";
    icon2.innerText = "dark_mode";
    setGiscusTheme("light");
  }
};

let night = document.cookie.replace(
  /(?:(?:^|.*;\s*)night\s*\=\s*([^;]*).*$)|^.*$/,
  "$1"
);

if (night == "") {
  if (
    window.matchMedia &&
    window.matchMedia("(prefers-color-scheme: dark)").matches
  ) {
    toggleDarkMode();
  }
} else {
  // If night is not empty
  if (night === "1") {
    toggleDarkMode();
  }
}

try {
  document
    .getElementById("darkModeToggleButton")
    .addEventListener("click", function () {
      toggleDarkMode();
    });

  document
    .getElementById("darkModeToggleButton2")
    .addEventListener("click", function () {
      toggleDarkMode();
    });
} catch (_) {

}



// Drawer

var openDrawer = function () {
  document.getElementsByTagName("html")[0].style.overflow = "hidden";
  document
    .getElementById("drawer-mask")
    .classList.add("single-column-drawer-mask");
  document
    .getElementById("drawer")
    .classList.add("single-column-drawer-container-active");
};

document
  .getElementById("nav_dropdown_btn")
  .addEventListener("click", function () {
    openDrawer();
  });

var closeDrawer = function () {
  document.getElementsByTagName("html")[0].style.overflow = "unset";
  document
    .getElementById("drawer-mask")
    .classList.remove("single-column-drawer-mask");
  document
    .getElementById("drawer")
    .classList.remove("single-column-drawer-container-active");
};

document.getElementById("drawer-mask").addEventListener("click", function () {
  closeDrawer();
});
