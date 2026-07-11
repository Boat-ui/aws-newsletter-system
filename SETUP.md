# Rebuilding your newsletter site: Supabase + GitHub Pages

Your old setup was: S3/CloudFront (hosting) + API Gateway + Lambda + DynamoDB (backend).
The new setup is: **GitHub Pages** (hosting, free) + **Supabase** (backend, free).

Also fixed along the way: the admin page used to check a password
(`TravelAdmin123`) that was sitting in plain text in the page's JavaScript —
anyone could view-source and read your subscriber list. The new admin.html
uses a real login (Supabase Auth) instead.

## 1. Create a Supabase project

1. Go to https://supabase.com → sign up (free) → "New project"
2. Pick a name, a database password (save it somewhere), and a region
3. Wait ~2 minutes for it to provision

## 2. Create the database table

1. In your Supabase project, open **SQL Editor** (left sidebar)
2. Open `supabase-schema.sql` from this folder, paste its contents in, click **Run**
3. This creates the `subscribers` table and locks it down so:
   - anyone can *submit* an email (insert)
   - only a logged-in admin can *view* the list (select)

## 3. Create your admin login

1. In Supabase, go to **Authentication → Users → Add user**
2. Enter the email/password you want to use to log into `admin.html`
3. That's it — no more hardcoded token

## 4. Get your API keys

1. Go to **Project Settings → API**
2. Copy the **Project URL** and the **anon public** key
   (do NOT use the `service_role` key anywhere in these files — that one
   bypasses all the security rules)
3. Open `config.js` in this folder and paste them in:
   ```js
   const SUPABASE_URL = "https://xxxxxxxx.supabase.co";
   const SUPABASE_ANON_KEY = "eyJhbGciOi...";
   ```

## 5. Push to GitHub and enable Pages

```bash
cd newsletter-site
git init
git add .
git commit -m "Rebuild with Supabase backend"
git branch -M main
git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPO.git
git push -u origin main
```

Then on GitHub:
1. Repo → **Settings → Pages**
2. Source: **Deploy from a branch** → Branch: `main`, folder: `/ (root)`
3. Save — your site will be live at `https://YOUR-USERNAME.github.io/YOUR-REPO/`
   within a minute or two

## 6. Test it

- Visit the site, subscribe with a test email
- Go to `/admin.html`, log in with the account from step 3
- You should see the test email in the list

## Notes

- The `anon` key in `config.js` is *meant* to be public — Supabase's security
  model relies on the RLS policies (step 2), not on hiding that key. Don't
  worry about it being visible in your repo.
- Never commit or expose the `service_role` key anywhere in this project.
- Free tier limits: Supabase free tier pauses projects after a week of
  inactivity (just visit the dashboard to unpause) and GitHub Pages is free
  for public repos indefinitely.
