import { redirect } from "next/navigation";

export default function HomePage() {
  // For now, redirect dashboard to /menus to show recent menus.
  redirect("/menus");
}

