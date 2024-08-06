import dotenv from "dotenv"
dotenv.config()

export const PORT = process.env.PORT;

export const mongoDBURL = process.env.MONOGODB_URI

// Please create a free database for yourself.
// This database will be deleted after tutorial