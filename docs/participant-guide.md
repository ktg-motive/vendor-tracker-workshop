# Vendor Tracker Workshop - Complete Participant Guide

Welcome to the LA-AI Builder's Lunch & Learn! Today you'll build a real web application with AI capabilities.

## Workshop Materials
🔗 **All materials available at:** https://github.com/ktg-motive/vendor-tracker-workshop

## What You're Building
A smart vendor management dashboard that:
- ✅ Tracks all your vendors and orders
- ✅ Predicts delivery times using AI
- ✅ Rates vendor performance
- ✅ Lives on the real internet!

---

## Pre-Workshop Setup ⚡
**You should have already created accounts at:**
- [ ] **Supabase:** https://supabase.com
- [ ] **Lovable:** https://lovable.dev  
- [ ] **GitHub:** https://github.com

---

## Step-by-Step Instructions

### 📊 Step 1: Database Setup (11:40-11:55)

1. **Go to Supabase** → Create new project
   - Project name: `vendor-tracker`
   - Password: Create a strong password (save it!)
   - Region: Select closest to you

2. **Set up database tables:**
   - Click **SQL Editor** in left sidebar
   - Click **New Query**
   - Go to: https://github.com/ktg-motive/vendor-tracker-workshop/blob/master/database/setup.sql
   - Copy ALL the SQL code
   - Paste into SQL Editor
   - Click **RUN** (bottom right)

3. **Import demo data:**
   - Go to **Table Editor** in left sidebar
   - For each table (vendors, orders, order_ratings):
     - Click the table name
     - Click **Import data via spreadsheet**
     - Upload matching CSV from: https://github.com/ktg-motive/vendor-tracker-workshop/tree/master/data

✅ **Checkpoint:** You should see data in all three tables!

---

### 🎨 Step 2: Build Your Interface (11:55-12:20)

1. **Go to Lovable.dev** → Click **"Create New"**

2. **Copy this exact prompt:**
```
Create a vendor order tracking dashboard with the following features:
- A modern, professional design with a blue color scheme
- Sidebar navigation with: Dashboard, Vendors, Orders, Analytics
- Main dashboard showing key metrics cards (Total Orders, Pending Deliveries, Average Rating, Total Spent)
- A recent orders table with columns: Order Date, Vendor, Amount, Status, Expected Delivery
- Use Tailwind CSS for styling
- Make it responsive for desktop screens
```

3. **Watch it build!** This is the magic moment ✨

4. **Add more features by copying these prompts one at a time:**

**Prompt 2 - Add Vendors Page:**
```
Add a vendors page that shows:
- A table of all vendors with columns: Name, Category, Contact Email, Typical Delivery Days, Average Rating
- An "Add New Vendor" button that opens a modal form
- Search and filter functionality
- Make each vendor name clickable to see their order history
```

**Prompt 3 - Add Order Entry:**
```
Add an orders page with:
- A "New Order" button that opens a form
- Form should have: Vendor dropdown, Order items text area, Expected delivery date picker, Total amount
- Order history table below with all fields
- Status badges (pending, delivered, cancelled) with different colors
```

**Prompt 4 - Add AI Prediction Button:**
```
On the new order form, add a "Predict Delivery" button next to the expected delivery date field. 
When clicked, it should:
- Show a loading spinner
- Display the AI prediction in a nice formatted box below
- Include confidence level with a colored indicator
- Show any warnings or patterns noticed
```

5. **Download your code:**
   - Click **Export** (top right)
   - Click **Download ZIP**
   - Save to your Downloads folder

✅ **Checkpoint:** You have a ZIP file with your complete app!

---

### 💾 Step 3: Save to GitHub (12:20-12:30)

1. **Go to GitHub.com**
   - Click green **"New"** button (top right)
   - Repository name: `vendor-tracker`
   - Keep it **Public**
   - Click **"Create repository"**

2. **Upload your code:**
   - Click **"uploading an existing file"**
   - Drag your entire unzipped folder
   - Write commit message: "My vendor tracker app"
   - Click **"Commit changes"**

✅ **Checkpoint:** Your code is saved professionally!

---

### 🤖 Step 4: Add AI Intelligence (12:30-12:45)

1. **Back in Supabase:**
   - Click **Edge Functions** in sidebar
   - Click **"New Function"**
   - Name: `predict-delivery`
   - Delete all the example code

2. **Copy the AI function code:**
   - Go to: https://github.com/ktg-motive/vendor-tracker-workshop/blob/master/functions/predict-delivery.ts
   - Copy ALL the code
   - Paste into Supabase
   - Click **Deploy**

3. **Set up the API key:**
   - Click on your function name
   - Click **"Manage Secrets"**
   - Add new secret:
     - Name: `OPENAI_API_KEY`
     - Value: *(instructor will provide)*

4. **Connect to your app:**
   - We'll do this together!

✅ **Checkpoint:** Click "Predict Delivery" and see AI analyze patterns!

---

### 🚀 Step 5: Deploy Live (12:45-12:55)

1. **Go to Vercel.com**
   - Sign in with GitHub
   - Click **"Add New Project"**
   - Import your `vendor-tracker` repository
   - Click **Deploy**

2. **While it deploys:**
   - Add your Supabase connection
   - We'll help with this part!

3. **Visit your live site!**
   - Click the URL Vercel provides
   - Share with your neighbor
   - You built this! 🎉

✅ **Checkpoint:** Your app is LIVE on the internet!

---

## 🔧 Troubleshooting

**Can't see data in Supabase?**
- Refresh the Table Editor page
- Make sure you imported all 3 CSV files

**Lovable looks different?**
- That's OK! AI is creative
- Use the specific prompts provided
- Ask for help if needed

**GitHub upload failed?**
- Make sure you unzipped the file first
- Try dragging the whole folder at once

**AI prediction not working?**
- Check that the Edge Function deployed
- Make sure API key is saved
- Try a vendor with order history

**Still stuck?** Raise your hand - we're here to help!

---

## 📝 Your Project Information

**Fill this in as you build:**

My Supabase Project URL: _________________________________

My GitHub Repository: _________________________________

My Live App URL: _________________________________

---

## 🎯 Next Steps - Your Homework!

**Choose ONE enhancement to add this week:**
- [ ] Email alerts for late deliveries
- [ ] Mobile-friendly responsive design
- [ ] Export to Excel button
- [ ] Vendor comparison charts
- [ ] Dark mode toggle
- [ ] Your own idea: _________________

**Share your progress:**
- LA-AI Discord: [Join our community]
- Email: kai@la-ai.org
- Show off at next week's meetup!

---

## 📚 Learning Resources

**Documentation:**
- Supabase Docs: https://supabase.com/docs
- Lovable Tutorials: https://lovable.dev/docs
- Our Workshop Repo: https://github.com/ktg-motive/vendor-tracker-workshop

**Get Help:**
- During workshop: Raise your hand!
- After workshop: kai@la-ai.org
- Office Hours: Fridays 2-4pm
- LA-AI Discord: [Community Link]

---

## 🚀 What's Next?

**You just learned:**
- ✅ How to set up a cloud database
- ✅ How to build UI with AI
- ✅ How to use version control
- ✅ How to integrate AI services
- ✅ How to deploy to production

**Your next projects could be:**
- Customer CRM
- Inventory Manager
- Invoice Generator
- Appointment Scheduler
- Event Planning System
- The sky's the limit!

---

## Notes Section

*Use this space for your notes, ideas, and aha moments!*








---

🎉 **Congratulations! You're now a builder!** 🎉