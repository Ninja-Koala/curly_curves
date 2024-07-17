#!/bin/bash
rm -r public
hugo
scp -r public koala@ninjakoa.la:curly_curves
ssh koala@ninjakoa.la 'rm -r html/curly_curves && mv curly_curves html/curly_curves'
