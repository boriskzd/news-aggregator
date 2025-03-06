# News Aggregator App

## Running with Docker

### Prerequisites

-   Docker installed on your machine.
-   Open Docker Desktop app on your computer ( recommended for ease of use ).

### Development Mode

Recommended ( using Docker Compose )

By using Docker Compose you will have Hot Reloading for development.

1. Run this command in terminal

    ```bash
    docker-compose up
    ```

2. Open http://localhost:3000 in your browser.

3. Edit your code locally, and changes will reflect automatically.

4. To stop, press `Ctrl + C` or run

    ```bash
    docker-compose down
    ```

Alternative ( Hot Reloading not working ):

1. Build your container:

    ```bash
    docker build --target development -t news-aggregator:dev .
    ```

2. Run your container:

    ```bash
    docker run -p 3000:3000 -v $(pwd):/app news-aggregator:dev
    ```

    OR

    If you want to have logs (optional but helpful) add `-it` in the command.

    ```bash
    docker run -it -p 3000:3000 -v $(pwd):/app news-aggregator:dev
    ```

3. Open http://localhost:3000 in your browser.

4. Edit your code locally.

5. To stop, press `Ctrl + C` or use `docker stop <container_id>`.

### Production

1. Build your container:

    ```bash
    docker build --target production -t news-aggregator:prod .
    ```

    Note: `--target production` is optional. Omitting it builds the same stage by default.

2. Run your container:

    ```bash
    docker run -p 3000:3000 news-aggregator:prod
    ```

3. Open http://localhost:3000 in your browser.

---

---

---

 <!-- Default Next.js README -->

This is a [Next.js](https://nextjs.org) project bootstrapped with [`create-next-app`](https://nextjs.org/docs/app/api-reference/cli/create-next-app).

## Getting Started

First, run the development server:

```bash
npm run dev
# or
yarn dev
# or
pnpm dev
# or
bun dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

You can start editing the page by modifying `app/page.tsx`. The page auto-updates as you edit the file.

This project uses [`next/font`](https://nextjs.org/docs/app/building-your-application/optimizing/fonts) to automatically optimize and load [Geist](https://vercel.com/font), a new font family for Vercel.

## Learn More

To learn more about Next.js, take a look at the following resources:

-   [Next.js Documentation](https://nextjs.org/docs) - learn about Next.js features and API.
-   [Learn Next.js](https://nextjs.org/learn) - an interactive Next.js tutorial.

You can check out [the Next.js GitHub repository](https://github.com/vercel/next.js) - your feedback and contributions are welcome!

## Deploy on Vercel

The easiest way to deploy your Next.js app is to use the [Vercel Platform](https://vercel.com/new?utm_medium=default-template&filter=next.js&utm_source=create-next-app&utm_campaign=create-next-app-readme) from the creators of Next.js.

Check out our [Next.js deployment documentation](https://nextjs.org/docs/app/building-your-application/deploying) for more details.
