import { json } from '@sveltejs/kit';

export async function POST({ request, cookies }) {
    const { username, password } = await request.json();

    // Simulated user authentication (replace with real database check)
    if (username && password === '1') {
        const sessionToken = 'fake-session-token'; // Normally a JWT or session ID

        // Set the authentication cookie
        cookies.set('auth_token', sessionToken, {
            httpOnly: true,  // Prevent JavaScript access (XSS protection)
            secure: false,    // Send only over HTTPS
            sameSite: 'strict', // CSRF protection
            path: '/',       // Accessible across the site
            maxAge: 60 * 60 * 24 // 1 day
        });

        return json({ success: true, message: 'Logged in!' });
    }

    return json({ error: 'Invalid credentials' }, { status: 401 });
}
