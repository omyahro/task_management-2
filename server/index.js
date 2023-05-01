const express = require("express");
const mongoose = require("mongoose");
const authRouter = require("./auth");

const PORT = process.env.PORT || 3000;
const app = express();

app.use(express.json());
app.use("/api", authRouter);

const DB =
 "mongodb+srv://kaylaaaa01:F1YGkKRn8MJag202@flutter.zawcilo.mongodb.net/test?retryWrites=true&w=majority";
 

mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});