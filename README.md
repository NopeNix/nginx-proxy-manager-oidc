# nginx-proxy-manager-oidc

This is a Updated Version of the [Open ID Connect Branch](https://github.com/NginxProxyManager/nginx-proxy-manager/tree/openidc) of [Nginx Proxy Manager](https://github.com/NginxProxyManager/nginx-proxy-manager).

It uses the current NPM (Nginx Proxy Manager) build and makes changes to implement the OpendIDC Features. The Original Image is too old to be Secure. This Image solves this Problem.

All the Environment Variables and so on are the Same the only difference is that it has the additional tab "OpenIDC" where you can enter your OIDC Details, nice!

# <span style="color: red;">**Known Bugs** Must Read</span>
<span style="color: red;">**You will be able to live with this Bug**</span>
### **The Webinterface behaves Strange when adding a new Entry** 

You are not able to save a entry without doint the following:
1. Go to OpenIDC Tab
2. Enable
3. Fill out the Fields. if you do not want to use oidc just fill a "1" in every field
4. Save
5. <u>(Only if you dont want to use OpenIDC):</u> Reopen the entry you just created go back to the OpenIDC Tab and Disable. Now you can save the entry and OpenIDC is disabled

# Help Needed
I dont know how to solve the Bug above i can live with it for now becuase the workarround works always and is not that hard or timeconsuming but it would be nice to have this solved :-)