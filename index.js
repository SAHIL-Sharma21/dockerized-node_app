//making simpleserver for dockerising put app

import express from 'express';

const app = express();

const PORT = process.env.PORT || 8080;

app.use(express.json());

app.get("/", (req, res) => {
    return res.json({
        message: "Hello im node in docker container."
    });
});

app.get("/api/v1/users", (req, res) => {
    const user = [
        {
            userName: "Sahil",
            lastName: "Sharma",
            designantion: "Software engg"
        },
        {
            userName: "Rahul",
            lastName: "kumar",
            designantion: "engg"
        },
        {
            userName: "Tijmittal",
            lastName: "Mittal",
            designantion: "Data engg"
        },
        {
            userName: "Avi Boss",
            lastName: "Boss",
            designantion: "marketing"
        },
        {
            userName: "Lugai",
            lastName: "Singh",
            designantion: "speaker"
        }
    ];

    res.send(user);
})


app.listen(PORT, () => {
    console.log(`our node server is running at port: ${PORT}`);
});