# Travel Newsletter

A simple newsletter signup site with an admin dashboard to view subscribers.

- **Hosting**: GitHub Pages (static files)
- **Backend**: Supabase (database + auth)

Originally built on AWS (S3/CloudFront + API Gateway + Lambda + DynamoDB),
migrated to this stack after the AWS resources were torn down.

## Files

| File | Purpose |
|---|---|
| `index.html` | Public signup page — visitors enter their email to subscribe |
| `admin.html` | Admin dashboard — log in to view the subscriber list |
| `config.js` | Your Supabase Project URL + API key (fill in before deploying) |
| `supabase-schema.sql` | Run once in Supabase's SQL Editor to create the `subscribers` table |
| `SETUP.md` | Full step-by-step setup and deployment guide |

## Quick start

See [`SETUP.md`](./SETUP.md) for the full walkthrough. Short version:

1. Create a free project at [supabase.com](https://supabase.com)
2. Run `supabase-schema.sql` in the SQL Editor
3. Add an admin user under Authentication → Users
4. Copy your Project URL + API key into `config.js`
5. Push this folder to a GitHub repo and enable **Settings → Pages**

## Security notes

- The admin dashboard requires a real login (Supabase Auth) — there is no
  hardcoded password anywhere in this code.
- Row Level Security (set up by `supabase-schema.sql`) means the public can
  only ever *insert* a subscription, never read or change the list. Only a
  logged-in admin can read it.
- The key in `config.js` is the public/anon (or "publishable") key — it's
  meant to be exposed in client-side code. Never put your `service_role` /
  secret key anywhere in this project.
