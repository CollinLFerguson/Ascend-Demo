import { json } from '@sveltejs/kit';

export async function POST({ cookies }) {
    cookies.set('auth_token', 'fake-jwt-token', {
        httpOnly: true,
        secure: true,
        sameSite: 'strict',
        path: '/',
        maxAge: 60 * 60 * 24 // 1 day
    });

    return json({ success: true });
}
