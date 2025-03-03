import { derived, writable } from "svelte/store";

// Function to load session data
function loadSessionData() {
    if (typeof sessionStorage !== 'undefined') {
        return {
            token: sessionStorage.getItem("token") || null,
            user: sessionStorage.getItem("user") ? JSON.parse(sessionStorage.getItem("user")) : null,
            isAuthenticated: sessionStorage.getItem("isAuthenticated") === "true"
        };
    }
    return { token: null, user: null, isAuthenticated: false };
}

// Create writable store with initial session values
const authState = writable(loadSessionData());

// Save to sessionStorage whenever authState updates
authState.subscribe(($authState) => {
    if (typeof sessionStorage !== 'undefined') {
        if ($authState.token) {
            sessionStorage.setItem("token", $authState.token);
            sessionStorage.setItem("user", JSON.stringify($authState.user));
            sessionStorage.setItem("isAuthenticated", $authState.isAuthenticated.toString());
        } else {
            sessionStorage.removeItem("token");
            sessionStorage.removeItem("user");
            sessionStorage.removeItem("isAuthenticated");
        }
    }
});

// Read-only stores for user and authentication status
export const isAuthenticated = derived(authState, ($authState) => $authState.isAuthenticated);
export const authenticatedUser = derived(authState, ($authState) => $authState.user);

export const authStore = {
    subscribe: authState.subscribe,
    
    login: async (username, password) => {
        try {
            const response = await fetch("/api/LoginController", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({ username, password }),
            });

            if (!response.ok) throw new Error("Login failed");

            const data = await response.json();

            authState.set({
                token: data.token,
                user: data.user,
                isAuthenticated: data.success
            });

        } catch (error) {
            console.error("Login error:", error);
            authState.set({ token: null, user: null, isAuthenticated: false });
        }
    },

    logout: () => {
        authState.set({ token: null, user: null, isAuthenticated: false });
    }
};
