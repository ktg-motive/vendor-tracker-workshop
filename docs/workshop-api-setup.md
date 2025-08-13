# Workshop API Key Setup

During the workshop, the instructor will provide a temporary OpenAI API key.

## Setting up the API Key in Supabase

1. In your Supabase project, go to **Edge Functions**
2. Click on your `predict-delivery` function
3. Click **Manage Secrets**
4. Add a new secret:
   - Name: `OPENAI_API_KEY`
   - Value: (instructor will provide this)

## For After the Workshop

To get your own OpenAI API key:
1. Go to https://platform.openai.com
2. Create an account
3. Add payment method
4. Generate an API key
5. Update the secret in your Supabase project

**Important:** Never commit API keys to GitHub!
