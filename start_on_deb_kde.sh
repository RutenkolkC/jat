#!/bin/bash


echo -n "Start Analyzer-Server via gradle run? (y/n)?"
read answerAnalyze

echo -n "Start clojure-middleware via lein repl? (y/n)?"
read answerMiddleware


konsole --separate --noclose -e bash --init-file <(echo ". \"$HOME/.bashrc\"; cd jat_frontend; npm run dev")&
konsole --separate --noclose -e bash --init-file <(echo ". \"$HOME/.bashrc\"; cd jat_frontend; npm run glue")&

konsole --separate --noclose -e bash --init-file <(echo ". \"$HOME/.bashrc\"; cd jat_refactor; gradle run")&

if [ "$answerAnalyze" != "${answerAnalyze#[Yy]}" ] ;then
    konsole --separate --noclose -e bash --init-file <(echo ". \"$HOME/.bashrc\"; cd jat_analyzer; ./gradlew run")&
else
    echo Not starting analyze-server
fi
if [ "$answerMiddleware" != "${answerMiddleware#[Yy]}" ] ;then
    konsole --separate --noclose -e bash --init-file <(echo ". \"$HOME/.bashrc\"; cd jat_clojure_middleware; lein repl")&
else
    echo Not starting middleware-server
fi
