---
title: Template für Folien (Markdown/Pandoc-Version)
author: Prof. Dr. Hannes Federrath
date: 25.08.2021
theme: svs2021
aspectratio: 169
classoption:
- handout
...



## Hinweis zu dieser Datei

Dies ist die Version des Beamer-Templates für Markdown-Folien. Markdown-Folien sind schnell und übersichtlich erstellt, können dafür aber viele mächtige Funktionen von LaTeX-Beamer nicht nutzen. Außerdem unterscheidet sich das Layout möglicherweise etwas. 

### Erzeugen des PDF mit pandoc: {.alert}

	FN=TemplateSVS2021_pandoc
	pandoc -t beamer $FN.md -o $FN.pdf

### 

Der Dateiname des Markdown-Dokuments der Folien (ohne Extension) liegt in `$FN`.

In der Gliederung werden nur die Überschriften der ersten Ebene (#) angezeigt. Folien bewirken keinen Eintrag in der Gliederung.



## Der Arbeitsbereich Sicherheit in Verteilten Systemen (SVS)

### Lorem ipsum dolor {.alert}

Eine hervorgehobene Textbox wird erzeugt mit `{.alert}`. Lorem ipsum dolor sit amet, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### 

* Themen
  1. Privacy Enhancing Technologies (PET)
  2. Security Management & Risk Management
  3. Security of Mobile Systems

* Weitere Informationen
  - https://svs.informatik.uni-hamburg.de



## Beispiel für eine Abbildung

* Ziel aus Sicht eines Dienstanbieters *A*: Einer Dienstnutzerin *N* einen Inhalt (Content) in einer bestimmten Weise zugänglich machen, ihn aber daran hindern, *alles* damit tun zu können.

![Abb](../pic/Abb1.pdf){width=60%}



## Weiteres Beispiel für eine Abbildung
\framesubtitle{[John Doe, 1966]}

* **Voraussetzung:** Angreifer betreibt täuschend echte Webseite der Bank und bewegt den Kunden zum Besuch dieser Seite

![Phishing](../pic/Abb2.pdf){width=85%}



## Example for right aligned small pictures close to bullet points
\framesubtitle{[Lindemann, 2019]}

:::::::::::::: {.columns}
::: {.column width="85%"}

* **Attack** to detect applications in co-resident virtual machines 
  - Automatically generating signatures for individual versions and groups of versions
  - Evaluation without load and under load

:::
::: {.column width="15%"}

![](../pic/sword.pdf){width=60%}

:::
::::::::::::::

\ 

:::::::::::::: {.columns}
::: {.column width="85%"}

* **Defence** mechanism against memory deduplication side-channel attacks
  - Fake deduplication of non-duplicate pages to level out write times
  - Evaluation of performance impact
  - Evaluation of impact on side-channel effectiveness

:::
::: {.column width="15%"}

![](../pic/shield.pdf){width=60%}

:::
::::::::::::::



## Ebenen

* Erste Ebene
  - Zweite Ebene
    - Dritte Ebene
  - Zweite Ebene

* Erste Ebene

1. Erste Ebene
   1. Zweite Ebene
      1. Dritte Ebene
   2. Zweite Ebene
2. Erste Ebene



## Spalten

:::::::::::::: {.columns}
::: {.column width=60%}

* Linke Spalte
  - Lorem ipsum dolor sit amet, 
  - consectetur adipisicing elit, 
  - sed do eiusmod tempor incididunt ut 
  - labore et dolore magna aliqua. 

* Erste Ebene
  - Zweite Ebene
  - Zweite Ebene

* Erste Ebene
  - Zweite Ebene
  - Zweite Ebene

:::
::: {.column width=40%}

![Altes SVS-Logo](../pic/svs_logo_uhhred.png){width=40%}

Das alte SVS-Logo wird seit 2016 aufgrund der CI-Richtlinien der UHH nicht mehr verwendet.

:::
::::::::::::::

