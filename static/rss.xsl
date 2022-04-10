<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:atom="http://www.w3.org/2005/Atom" xmlns:dc="http://purl.org/dc/elements/1.1/"
                xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <title><xsl:value-of select="/rss/channel/title"/> Feed</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
        <style type="text/css">body{text-rendering:optimizeLegibility;-webkit-font-smoothing:antialiased;-moz-osx-font-smoothing:grayscale;margin:0;color:rgba(0,0,0,.86);font:16px/1.42 -apple-system,BlinkMacSystemFont,Helvetica Neue,PingFang SC,Hiragino Sans GB,Droid Sans Fallback,Microsoft YaHei,sans-serif}img{max-width:100%}.inner{max-width:860px;margin:0 auto;padding:0 20px;box-sizing:border-box}.top{margin-top:10px;font-size:12px}.top,.top a{color:#9ea0a6}.head{padding-top:80px;padding-bottom:40px}.head_logo{float:left;width:120px;height:120px;margin-right:20px}.head_main{overflow:hidden}.head h1{font-size:36px;font-weight:400;margin:0;color:#000}.head p{margin:0 0 10px;font-size:18px;font-weight:300;color:#9ea0a6}.head .head_link{font-size:14px;font-weight:600;color:#333;text-decoration:none}.links{margin:30px auto}.links a{display:inline-block;text-decoration:none;line-height:28px;padding-left:30px;background-position:0;background-size:24px 24px;background-repeat:no-repeat;font-weight:600;color:#333}.links a+a{margin-left:1.4em}.podcast{background-image:url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIzMiIgaGVpZ2h0PSIzMiI+PHBhdGggZmlsbD0iIzkzYyIgZD0iTTE1LjkwNyAzMnMzLjUxMSAwIDMuNTExLTEwLjM5MmMwLTEuOTM1LTEuNTczLTMuNTExLTMuNTExLTMuNTExcy0zLjUxMiAxLjU3Ni0zLjUxMiAzLjUxMUMxMi4zOTUgMzIgMTUuOTA3IDMyIDE1LjkwNyAzMnptNC4zMDYtMy41NDFhMTguODQgMTguODQgMCAwIDAgLjM2Ny0xLjgwMWwuMDcxLS40OGMuMTUzLS4wNjcuMzA3LS4xMzEuNDYxLS4yYTEyLjY4NyAxMi42ODcgMCAwIDAgNS43OTctNS4zMjQgMTIuNTIzIDEyLjUyMyAwIDAgMCAxLjI5Ny0zLjQyOSAxMi4zMyAxMi4zMyAwIDAgMCAuMjIxLTQuMTE3QTExLjg4IDExLjg4IDAgMCAwIDI3LjQgOS4zOTJhMTIuMTMzIDEyLjEzMyAwIDAgMC0yLjU2NS0zLjcxMiAxMi41NzQgMTIuNTc0IDAgMCAwLTMuODMzLTIuNjI5Yy0xLjQ2NC0uNjYxLTMuMDcxLTEuMDAzLTQuNjkzLTEuMDQzYTEyLjUwNCAxMi41MDQgMCAwIDAtNC43NzYuODA0IDEyLjU1IDEyLjU1IDAgMCAwLTYuNyA2LjAxNiAxMi45MDIgMTIuOTAyIDAgMCAwLTEuMjAzIDMuNjMxIDEyLjY1OCAxMi42NTggMCAwIDAgMS4wMDMgNy4zNjQgMTIuNjcyIDEyLjY3MiAwIDAgMCA1LjY3NyA1Ljg1OWMuMzAxLjEzOS42MDEuMjguOTIzLjQxOS4wMi4xNjEuMDYxLjM0MS4wOC41MjMuMS41ODQuMjIxIDEuMTg1LjM2MSAxLjc2N2ExNS42NiAxNS42NiAwIDAgMS0xLjYwNS0uNjI0IDE0LjY0NyAxNC42NDcgMCAwIDEtNi44MDEtNi4zMzkgMTQuOTU1IDE0Ljk1NSAwIDAgMS0xLjQ2NC00LjAxMyAxMy44OTggMTMuODk4IDAgMCAxLS4yLTQuNzU1Yy4yLTEuNDgzLjYyMS0yLjk0OCAxLjI0NC00LjI5M2ExNC45MTEgMTQuOTExIDAgMCAxIDMuMDI4LTQuMjcyIDEzLjk3NCAxMy45NzQgMCAwIDEgNC40MTMtMi45NDhBMTQuNjU0IDE0LjY1NCAwIDAgMSAxNS43Ny4wMDRjMS44ODMtLjAyIDMuNzY1LjMyIDUuNTE5IDEuMDExYTE0LjUzNiAxNC41MzYgMCAwIDEgNC41NzMgMi44ODggMTQuNTUzIDE0LjU1MyAwIDAgMSAzLjEyOCA0LjE4NSAxNC4zMTcgMTQuMzE3IDAgMCAxIDEuMzQ0IDQuMjMzIDE0LjE0IDE0LjE0IDAgMCAxLS4wMjEgNC41OTVjLS4yMjEgMS40MDQtLjY4MyAyLjc4OC0xLjMwNSA0LjA3MWExNC42MzUgMTQuNjM1IDAgMCAxLTYuNTYgNi41NjNjLS43MDMuMzQxLTEuNDQ1LjY0MS0yLjIwNy44ODFsLS4wMjguMDMxem0uNjk0LTUuNzI3bC4wMTMtLjYyN2MwLS40MjEgMC0uODQzLS4wNjEtMS4yNTctLjAyLS4xNjEtLjA2LS4zMDEtLjEtLjQ2MWE3LjI2NSA3LjI2NSAwIDAgMCAxLjgyNS0yLjIyNyA3LjUxNSA3LjUxNSAwIDAgMCAuNzQzLTIuMDY4Yy4xNjEtLjgwMy4yLTEuNjQ0LjA4MS0yLjQ4N2E4LjAxMiA4LjAxMiAwIDAgMC0uNjAxLTIuMTQ3IDcuODA4IDcuODA4IDAgMCAwLTEuNTQ0LTIuMjI3IDcuOTIzIDcuOTIzIDAgMCAwLTIuMjQ4LTEuNTQ1IDcuODM2IDcuODM2IDAgMCAwLTIuOTI5LS42NjEgNy45MDUgNy45MDUgMCAwIDAtMi45NjkuNTIzIDcuNzEgNy43MSAwIDAgMC0yLjMwNyAxLjQ0NCA3LjIwMyA3LjIwMyAwIDAgMC0xLjY0NyAyLjE2NSA3LjY4NCA3LjY4NCAwIDAgMC0uNzIzIDIuMTA3IDcuNDc2IDcuNDc2IDAgMCAwLS4wNiAyLjMwN2MuMS43NDMuMzAxIDEuNDY1LjYwMSAyLjE0NWE3Ljg0OSA3Ljg0OSAwIDAgMCAxLjk4NyAyLjY2OWwtLjEyMS41NDFjLS4wOC40MjEtLjA2LjgyMy0uMDYgMS4yNjN2LjU2M2E5LjQ3MyA5LjQ3MyAwIDAgMS0zLjM1MS0zLjU1MSA4Ljc4MiA4Ljc4MiAwIDAgMS0uOTY0LTIuNjI5IDkuMTA5IDkuMTA5IDAgMCAxLS4xMi0zLjEyOWMuMTItLjk0My4zODEtMS44NjUuNzYzLTIuNzA5LjQ2MS0xLjA0MSAxLjE0My0yLjAwNSAxLjk0NS0yLjgyOGE5LjM2NCA5LjM2NCAwIDAgMSAyLjgyOC0xLjk0NSA5LjgyIDkuODIgMCAwIDEgMy42OTItLjg0MyA5Ljg3MiA5Ljg3MiAwIDAgMSAzLjc1MS42NjMgOS4zOTYgOS4zOTYgMCAwIDEgMi45MjkgMS44MjQgOS44NTYgOS44NTYgMCAwIDEgMi4wODUgMi43MjljLjQyMS44NDMuNzQzIDEuNzQ1LjkwNCAyLjY2OC4xNjEuOTY0LjIgMS45NDUuMDYgMi45MDlhOS4xNTcgOS4xNTcgMCAwIDEtLjc4NCAyLjcyOCA5LjUxIDkuNTEgMCAwIDEtMy43NzEgNC4yMzVsLjE1Mi0uMTQxem0tNS0xMi43NjdhMy41NCAzLjU0IDAgMCAxIDMuNTM5IDMuNTQxIDMuNTQyIDMuNTQyIDAgMCAxLTMuNTM5IDMuNTQ5Yy0xLjk1NiAwLTMuNTQtMS41ODUtMy41NC0zLjUzMXMxLjU4NC0zLjUzMiAzLjU0LTMuNTMydi0uMDI4eiIvPjwvc3ZnPg==)}.castro{background-image:url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIzMiIgaGVpZ2h0PSIzMiI+PHBhdGggZmlsbD0iIzAwYjI2NSIgZD0iTTE2IDBDNy4xNjMgMCAwIDcuMTY0IDAgMTZzNy4xNjMgMTYgMTYgMTZjOC44MzYgMCAxNi03LjE2NCAxNi0xNlMyNC44MzYgMCAxNiAwem0tLjAwMyAxOC42NTVhMi43MzcgMi43MzcgMCAwIDEgMC01LjQ3NCAyLjczNyAyLjczNyAwIDAgMSAwIDUuNDc0em02LjY2IDYuNDdsLTIuNjgzLTMuNzIxYTYuNzc5IDYuNzc5IDAgMSAwLTcuOTk1LjAwM2wuMDE5LjAxMy0yLjY4NSAzLjcyNGMtMi44NjktMi4wOS00LjcxMi01LjQzOC00LjcxMi05LjIxNiAwLTYuMjc4IDUuMDktMTEuMzY4IDExLjM2OC0xMS4zNjhoLjAwM2M2LjI3OCAwIDExLjM2OCA1LjA5IDExLjM2OCAxMS4zNjh2LjAxM2MwIDMuNzYzLTEuODMxIDcuMDk3LTQuNjUxIDkuMTYybC0uMDMyLjAyMnoiLz48L3N2Zz4=)}.google{background-image:url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIzMiIgaGVpZ2h0PSIzMiI+PHBhdGggZmlsbD0iIzQyODVmNCIgZD0iTTIgMTIuOTA3Yy0xLjEwNyAwLTIgLjg5My0yIDJ2Mi4xNzNhMiAyIDAgMSAwIDQgMHYtMi4xNzNjMC0xLjEwNy0uODkzLTItMi0yem0yOCAwYy0xLjEwNyAwLTIgLjg5My0yIDJ2Mi4xNzNhMiAyIDAgMSAwIDQgMHYtMi4xNzNjMC0xLjEwNy0uODkzLTItMi0yek04LjkwNyAxOS40NTNjLTEuMTA3IDAtMiAuODkzLTIgMnYyLjE3M2EyIDIgMCAxIDAgNCAwdi0yLjE2YzAtMS4xMDctLjg5My0yLTItMnptMC0xMy4wOTNjLTEuMTA3IDAtMiAuODkzLTIgMnY3LjE0N2EyIDIgMCAxIDAgNCAwdi03LjE2YzAtMS4xMDctLjg5My0yLTItMnptMTQuMTg2IDBjLTEuMTA3IDAtMiAuODkzLTIgMnYyLjE4N2EyIDIgMCAxIDAgNCAwVjguMzZjMC0xLjEwNy0uODkzLTItMi0yek0xNiAwYy0xLjEwNyAwLTIgLjg5My0yIDJ2Mi4xNzNhMiAyIDAgMSAwIDQgMFYyYzAtMS4xMDctLjg5My0yLTItMnptMCAyNS44MTNjLTEuMTA3IDAtMiAuODkzLTIgMnYyLjE5NGEyIDIgMCAwIDAgNCAuMDA3di0yLjE4N2MwLTEuMDkzLS44OTMtMi0yLTJ6bTcuMDkzLTExLjI4Yy0xLjEwNyAwLTIgLjkwNy0yIDJ2Ny4xMDdhMiAyIDAgMSAwIDQgMHYtNy4xMDdjMC0xLjEwNy0uODkzLTItMi0yek0xNiA4LjE3M2MtMS4xMDcgMC0yIC45MDctMiAydjExLjY0YTIgMiAwIDEgMCA0IDBWMTAuMTg2YzAtMS4xMDctLjg5My0yLTItMnoiLz48L3N2Zz4=)}.spotify{background-image:url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIzMiIgaGVpZ2h0PSIzMiI+PHBhdGggZmlsbD0iIzFlZDc2MCIgZD0iTTE2IDBDNy4yIDAgMCA3LjIgMCAxNnM3LjIgMTYgMTYgMTYgMTYtNy4yIDE2LTE2UzI0Ljg4IDAgMTYgMHptNy4zNjEgMjMuMTJjLS4zMi40NzktLjg4LjY0LTEuMzYxLjMyLTMuNzYtMi4zMi04LjQ4LTIuODAxLTE0LjA4MS0xLjUyMS0uNTU3LjE2My0xLjAzOS0uMjM5LTEuMTk5LS43MTktLjE2LS41NjEuMjQtMS4wNC43Mi0xLjIgNi4wOC0xLjM2MSAxMS4zNi0uOCAxNS41MiAxLjc2LjU2LjI0LjYzOS44NzkuNDAxIDEuMzZ6bTEuOTItNC40Yy0uNDAxLjU2LTEuMTIxLjgtMS42ODMuNC00LjMxOS0yLjY0LTEwLjg3OS0zLjQ0LTE1LjkxOS0xLjg0LS42MzkuMTYtMS4zNi0uMTYtMS41Mi0uOHMuMTYtMS4zNjEuOC0xLjUyMWM1Ljg0LTEuNzU5IDEzLjA0LS44NzcgMTggMi4xNjEuNDgxLjI0MS43MiAxLjA0LjMyMSAxLjZ6bS4xNi00LjQ4QzIwLjMyIDExLjIgMTEuNzYgMTAuODggNi44OCAxMi40MDFjLS44LjIzOS0xLjYtLjI0MS0xLjg0LS45NjEtLjI0LS44MDEuMjQtMS42Ljk2LTEuODQxIDUuNjgtMS42OCAxNS4wNC0xLjM2IDIwLjk2MSAyLjE2MS43MTkuNC45NTkgMS4zNi41NTkgMi4wOC0uMzk5LjU2MS0xLjM2Ljc5OS0yLjA3OS40eiIvPjwvc3ZnPg==)}.overcast{background-image:url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIzMiIgaGVpZ2h0PSIzMiI+PHBhdGggZmlsbD0iI2ZjN2UwZiIgZD0iTTE2IDMyQzcuMTg1IDMyLjAyNC4wMjMgMjQuODk1IDAgMTYuMDgxVjE2QzAgNy4xMzMgNy4xMzUgMCAxNiAwczE2IDcuMTMzIDE2IDE2YzAgOC44NjUtNy4xMzUgMTYtMTYgMTZ6bTAtNi4zMzVsMS4yLTEuMTk5LTEuMi00LjYtMS4yIDQuNiAxLjIgMS4xOTl6bS0xLjUzMy0uMDY2bC0uNiAyLjI2OCAxLjQtMS40MDMtLjgtLjg2NXptMy4wNjYgMGwtLjguODAxIDEuNCAxLjQwMS0uNi0yLjIwM3ptMS4xMzQgNC4xMzZMMTYgMjcuMDY3bC0yLjY2NyAyLjY2OEMxNC4yIDI5Ljg2OCAxNS4wNjYgMzAgMTYgMzBzMS44LS4wNjcgMi42NjctLjI2NXpNMTYgMkM4LjI2OCAyIDIgOC4yNjggMiAxNmExMy45MyAxMy45MyAwIDAgMCA5LjQwMSAxMy4xOTlsMy0xMS4xMzNhMi41OTcgMi41OTcgMCAwIDEtMS4wNjgtMi4xMzNjMC0xLjQ2OCAxLjItMi42NjggMi42NjctMi42NjhzMi42NjcgMS4yIDIuNjY3IDIuNjY4YzAgLjg2NS0uNDAxIDEuNi0xLjA2OCAyLjEzM2wzIDExLjEzM0ExMy45MjcgMTMuOTI3IDAgMCAwIDMwIDE2YzAtNy43MzItNi4yNjgtMTQtMTQtMTR6bTkuMTMzIDIwLjkzM2MtLjM0LjQyNS0uOTUyLjUxMy0xLjM5OS4yYS45MDguOTA4IDAgMCAxLS4yLTEuMzM1czEuOC0yLjM5OSAxLjgtNS44LTEuOC01LjgtMS44LTUuOGEuOTA3LjkwNyAwIDAgMSAuMTIxLTEuMjc2Yy4wMjctLjAyMS4wNTItLjA0MS4wOC0uMDU5YTEuMDMzIDEuMDMzIDAgMCAxIDEuMzk5LjJjLjEzMy4xMzUgMi4yIDIuODY3IDIuMiA2LjkzM3MtMi4wNjkgNi44MDMtMi4yMDEgNi45MzZ6bS00Ljg2OC0yLjZjLS40LS40LS4zMzItMS4xMzMuMDY4LTEuNTMzIDAgMCAxLTEuMDY1IDEtMi44cy0xLTIuNzM1LTEtMi44Yy0uNC0uNDAxLS40LTEuMDY4LS4wNjgtMS41MzNhLjkyMS45MjEgMCAwIDEgMS40MDEtLjA2OGMuMDY4LjA2OCAxLjY2NyAxLjczNSAxLjY2NyA0LjQwMXMtMS41OTkgNC4zMzMtMS42NjcgNC40MDFjLS40MDEuMzk5LTEgLjMzMy0xLjQwMS0uMDY4em0tOC41MyAwYy0uNDAxLjQwMS0xIC40NjctMS40MDEuMDY4LS4wNjgtLjEzNi0xLjY2Ny0xLjczNS0xLjY2Ny00LjQwMXMxLjU5OS00LjI2NSAxLjY2Ny00LjQwMWMuNDAxLS4zOTkgMS4wNjgtLjM5OSAxLjQwMS4wNjguNC40LjMzMiAxLjEzMy0uMDY4IDEuNTMzIDAgLjA2NS0xIDEuMDY1LTEgMi44czEgMi44IDEgMi44Yy40LjQuNDY4IDEuMDY1LjA2OCAxLjUzM3ptLTMuNDcgMi44MDJhMS4wMzUgMS4wMzUgMCAwIDEtMS40LS4yQzYuNzM0IDIyLjggNC42NjYgMjAuMDY3IDQuNjY2IDE2czIuMDY4LTYuOCAyLjE5OS02LjkzM2ExLjAzMiAxLjAzMiAwIDAgMSAxLjQtLjIuOTA4LjkwOCAwIDAgMSAuMjU5IDEuMjU1Yy0uMDE3LjAyNy0uMDM3LjA1My0uMDU3LjA3OSAwIDAtMS44IDIuMzk5LTEuOCA1LjhzMS44IDUuOCAxLjggNS44Yy4zMzMuNC4yIDEtLjIwMSAxLjMzNXoiLz48L3N2Zz4=)}.links a.podcast:hover{color:#93c}.links a.castro:hover{color:#00b265}.links a.google:hover{color:#4285f4}.links a.spotify:hover{color:#1ed760}.links a.overcast:hover{color:#fc7e0f}.item{border-top:1px solid rgba(0,0,0,.04);padding:20px;margin:20px auto}.item_meta{font-size:14px;color:#9ea0a6}.item a{color:rgba(0,0,0,.98);text-decoration:none}.item>h2{margin:0}.item>h3{margin:6px 0 10px;font-size:18px;font-weight:300;color:#9ea0a6}.item>audio{display:block;width:100%;margin-top:20px}.typlog-foot{border-top:1px solid rgba(0,0,0,.04);padding:10px 20px}.typlog-foot .title{text-decoration:none;text-transform:uppercase;font-size:16px;font-weight:900;color:rgba(0,0,0,.2);letter-spacing:.02em;margin-right:1em}.typlog-foot nav{display:inline-block}.typlog-foot nav>a{text-decoration:none;color:rgba(0,0,0,.6);-webkit-transition:color .2s ease;transition:color .2s ease;font-size:.92em}.typlog-foot nav>a+a:before{content:" / ";font-size:10px;color:rgba(0,0,0,.1)}</style>
      </head>
      <body>
        <xsl:if test="/rss/channel/itunes:image">
          <div class="top inner">
            This is a Podcast RSS Feed generated by <a href="https://typlog.com/" target="_blank">Typlog</a>.
            Podcast apps can use the URL in the address bar. Find out
            <a href="https://blog.typlog.com/subscribe-podcast-feed" target="_blank">
              how to subscribe a podcast via feed</a>.
          </div>
        </xsl:if>
        <xsl:if test="/rss/channel/item/dc:creator">
          <div class="top inner">
            This is a RSS Feed generated by <a href="https://typlog.com/" target="_blank">Typlog</a>.
            RSS readers can use the URL in the address bar.
          </div>
        </xsl:if>
        <div class="head inner">
          <xsl:if test="/rss/channel/image">
            <a class="head_logo">
              <xsl:attribute name="href">
                <xsl:value-of select="/rss/channel/link"/>
              </xsl:attribute>
              <img>
                <xsl:attribute name="src">
                  <xsl:value-of select="/rss/channel/image/url"/>
                </xsl:attribute>
                <xsl:attribute name="title">
                  <xsl:value-of select="/rss/channel/title"/>
                </xsl:attribute>
              </img>
            </a>
          </xsl:if>
          <div class="head_main">
            <h1><xsl:value-of select="/rss/channel/title"/></h1>
            <p><xsl:value-of select="/rss/channel/description"/></p>
            <a class="head_link" target="_blank">
              <xsl:attribute name="href">
                <xsl:value-of select="/rss/channel/link"/>
              </xsl:attribute>
              Visit Website &#x2192;
            </a>
          </div>
        </div>
        <xsl:if test="/rss/channel/atom:link[@rel='alternate']">
          <div class="links inner">
            <xsl:for-each select="/rss/channel/atom:link[@rel='alternate']">
              <a target="_blank">
                <xsl:attribute name="class">
                  <xsl:value-of select="@icon"/>
                </xsl:attribute>
                <xsl:attribute name="href">
                  <xsl:value-of select="@href"/>
                </xsl:attribute>
                <xsl:value-of select="@title"/>
              </a>
            </xsl:for-each>
          </div>
        </xsl:if>
        <xsl:for-each select="/rss/channel/item">
          <div class="item inner">
            <div class="item_meta">
              <span><xsl:value-of select="pubDate" /></span>
              <xsl:if test="itunes:duration">
                &#x02022;
                <span><xsl:value-of select="itunes:duration" /></span>
              </xsl:if>
            </div>
            <h2>
              <a target="_blank">
                <xsl:attribute name="href">
                  <xsl:value-of select="link"/>
                </xsl:attribute>
                <xsl:value-of select="title"/>
              </a>
            </h2>
            <xsl:if test="itunes:subtitle">
              <h3><xsl:value-of select="itunes:subtitle" /></h3>
            </xsl:if>
            <xsl:if test="itunes:duration">
              <audio controls="true" preload="none">
                <xsl:attribute name="src">
                  <xsl:value-of select="enclosure/@url"/>
                </xsl:attribute>
              </audio>
            </xsl:if>
          </div>
        </xsl:for-each>
        <div class="typlog-foot">
          <a class="title" href="https://typlog.com/?utm_medium=feed">Typlog</a>
          <nav>
            <a href="https://typlog.com/about?utm_medium=feed">About</a>
            <a href="https://typlog.com/terms?utm_medium=feed">Terms</a>
          </nav>
		  <div style="font-size: 14px"> | This is an <a href="https://www.wikipedia.org/wiki/RSS">RSS</a> feed, intended for news-feed readers like <a href="https://nodetics.com/feedbro/">FeedBro</a> (Browser), <a href="https://play.google.com/store/apps/details?id=com.madsvyat.simplerssreader">Simple RSS Reader</a> (Android), <a href="https://apps.apple.com/us/app/inoreader-news-app-rss/id892355414">Inoreader</a> (iOS), <a href="https://quiterss.org/">QuiteRSS</a> (Desktop) or <a href="https://www.thunderbird.net/">Thunderbird</a> (Email). There may also be <a href="https://www.wikipedia.org/wiki/Podcast">podcast</a> episodes available by opening in <a href="https://www.apple.com/itunes/">iTunes</a> or <a href="https://gpodder.github.io/">gPodder</a>.</div>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>