import { writable } from "svelte/store";

const authState = writable({
  token: null,
  userID: null,
  isAuthenticated: false
});

export const authStore = {
  subscribe: authState.subscribe, // Exposes state read-only
  login: async (username: any, password: any) => {
    try {
      const response = await fetch("/api/login", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ username, password }),
      });

      if (!response.ok) throw new Error("Login failed");

      const data = await response.json();

      authState.set({
        token: data.token,
        userID: data.userID,
        isAuthenticated: true
      });

    } catch (error) {
      console.error("Login error:", error);
      authState.set({ token: null, userID: null, isAuthenticated: false });
    }
  },
  logout: () => {
    authState.set({ token: null, userID: null, isAuthenticated: false });
  }
};