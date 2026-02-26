"use client";

import "./globals.css";
import { ReactNode } from "react";

export const metadata = {
  title: "Daily Menu Manager",
  description: "Manage daily restaurant menus with dishes and categories",
};

export default function RootLayout({ children }: { children: ReactNode }) {
  return (
    <html lang="en">
      <body className="min-h-screen bg-slate-50 text-slate-900">
        <div className="mx-auto flex min-h-screen max-w-5xl flex-col px-4 py-6">
          <header className="mb-6 flex items-center justify-between border-b border-slate-200 pb-4">
            <h1 className="text-2xl font-semibold">Daily Menu Manager</h1>
          </header>
          <main className="flex-1">{children}</main>
        </div>
      </body>
    </html>
  );
}

