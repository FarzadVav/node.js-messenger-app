import express from "express";

const app = express();

app.get("/", (req, res) => {
  console.log(req);
  res.send("Hello World!");
});

const port = process.env.PORT;
app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
