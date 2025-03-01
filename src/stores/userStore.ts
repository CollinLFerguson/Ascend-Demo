import { readable, derived } from "svelte/store";
import { authStore } from "./authStore";

export const userStore = derived(authStore, ($authStore, set) => {
  if ($authStore.isAuthenticated && $authStore.userID) {
    fetch(`/api/users/${$authStore.userID}`, {
      headers: { Authorization: `Bearer ${$authStore.token}` }
    })
      .then(response => {
        if (!response.ok) throw new Error("Failed to fetch user data");
        return response.json();
      })
      .then(userData => set(userData))
      .catch(error => {
        console.error("User data fetch error:", error);
        set(null);
      });
  } else {
    set(null);
  }
}, null); // Default to `null`