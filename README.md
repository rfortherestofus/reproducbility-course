---
editor_options: 
  markdown: 
    wrap: 72
---

# Reproducibility course

This is an outline for development of an introductory reproducibility
course.

## Part 0: Introduction

[no exercises in this section, downloads only]

### Lesson 1: Purpose (research and document quality, collaboration)

-   Define reproducibility and how it is distinct from replicability and
    repeatability
-   Discuss the need for reproducible practices for research (cover bad
    science, its implications, and how reproducible practices help)
-   Discuss how reproducible practices facilitate collaboration (with
    others and future you)
-   Resources:
    -   [Use of reproducible research practices in public
        health](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0202447):
        A survey of public health analysts

    -   [Retraction Watch](https://retractionwatch.com)

    -   [Examining the reproducibility of 6 published
        studies](https://www.researchgate.net/publication/323391211_Examining_the_Reproducibility_of_6_Published_Studies_in_Public_Health_Services_and_Systems_Research)
        in public health services and systems research

### Lesson 2: Course logistics

-   Technical requirements, prior knowledge expectations (expect
    familiarity with R coding especially tidyverse for data management
    and visualization)
-   Course overview and recommendations (use RStudio)
-   Walk through of zip file containing R code file, codebook, data, R
    Project
-   Walk through the reproducible report that will be the final product
    (take the cake out of the oven)

[Provide zip file of code, codebook, data, R Project, text in an
unformatted text file. Data and codebook are publicly available 2019
SPSS data file and Word document codebook from Pew on internet use by
teenagers.]

## Part I: Writing reproducible code

### Lesson 3: Using space wisely

-   Introduce rationale for using white space
-   Discuss the 80 character rule, spaces before and after operators,
    hard returns after procedures, hard returns after commas, indenting
    code, and other strategies for making code readable
-   Introduce tools for automatically checking and restyling code:
    [styler](https://styler.r-lib.org) and
    [lintr](https://github.com/r-lib/lintr)
-   Demo: fix spacing in provided R code file
-   Exercise: fix spacing in provided R code file
-   Resources:
    -   [The tidyverse style guide](https://style.tidyverse.org)
    -   [The Art of Readable
        Code](http://shop.oreilly.com/product/9780596802301.do) by
        Boswell & Foucher

### Lesson 4: Naming things

-   Introduce rationale for using meaningful human (and machine)
    readable names for variables, data frames, functions, files, and
    other nameable things
-   Two parts to naming things
    -   Information in the name
        -   Use meaningful words
        -   Avoid reserve words
    -   Format of the name
        -   Avoid spaces and special characters

        -   Consistently use:

            -   camelCase
            -   dot.case
            -   snake_case
            -   UPPER_SNAKE_CASE
            -   PascalCase
            -   kebab-case
-   tidyverse refresher
    -   The rename function
    -   The mutate/recode_factor functions
-   Demo: clean up names in provided R code file
-   Exercise: clean up names in provided R code file
-   Resources:
    -   [The tidyverse style guide](https://style.tidyverse.org)
    -   [The Art of Readable
        Code](http://shop.oreilly.com/product/9780596802301.do) by
        Boswell & Foucher

### Lesson 5: Using function arguments

-   Introduce recommendations and rationale for using function arguments
    - formal arguments vs. actual or calling arguments
    - three ways of specifying arguments: exact, partial, and position
-   The benefits of exact or partial over position
-   Demo: show how argument ordering works by flipping the order in a ggplot
-   Demo: add function arguments in provided R code file
-   Exercise: add function arguments in provided R code file
-   Resources:
    -   [The tidyverse style guide](https://style.tidyverse.org/functions.html)

    -   [The Art of Readable
        Code](http://shop.oreilly.com/product/9780596802301.do) by
        Boswell & Foucher
        
### Lesson 6: Prolog & Annotation

-   Introduce recommendations and rationale for annotation and prolog
-   Show the different varieties of prolog
    - The short informal prolog
    - The long formal prolog
-   Discuss pros and cons of annotation
    - Annotation should be the reason for the code not describe what it does
    - Some suggest it makes work less reproducible since often not updated
    - Clear code is the goal, annotation used sparingly to clarify is useful
-   Demo: add annotation and prolog to provided R code file
-   Exercise: add annotation and prolog to provided R code file
-   Resources:
    -   [The tidyverse style guide](https://style.tidyverse.org/functions.html)
    -   [The Art of Readable
        Code](http://shop.oreilly.com/product/9780596802301.do) by
        Boswell & Foucher
    -   [coding2share Reproducibility Toolkit](https://coding2share.github.io/ReproducibilityToolkit/Mod3Code.html#intro)

### Lesson 7: Using seed values

-   Introduce the concept of a seed value
-   Discuss settings where seed values are applicable
-   Demonstrate how a seed value makes a difference in example code
-   Demo: add seed value to provided R code file
-   Exercise: add seed value to provided R code file

### Lesson 8: Writing functions for repeated tasks

-   Introduce the 3 times rule (if you do the same thing more than 3
    times, write a function for it)
-   Demonstrate how to write a very simple function
-   Demonstrate how a function makes a difference in example code (the
    long way v. the short way)
-   Demo: add seed value to provided R code file
-   Exercise: add seed value to provided R code file

## Part II: Developing reproducible documents

### Lesson 8: Integrating code and text

-   Introduce literate programming and RMarkdown in particular
-   Discuss the difference between code chunks and the rest of the
    document
-   Show code chunk naming and how it helps organize
-   Discuss common and useful formatting tools including hashtags and
    asterisks
-   Show how to set code chunk options for the document and how to
    override for each code chunk
-   Demonstrate how to create a word template and knit a well-formatted
    word document
-   Demo: add and format some text, knit the document
-   Exercise: add and format additional text, knit the document

### Lesson 9: Embedding data and RMarkdown files into knitted documents

-   Discuss that to reproduce documents it's important to have the code
    and data (when possible)
-   RMarkdown can embed data sources and RMarkdown files in knit
    documents using the xfun package
-   Demo: use xfun to embed the RMarkdown file and the Pew data into the
    knit html file

### Lesson 10: Keeping R package versions consistent over time

-   Discuss package versions
-   Demo: show how to use the renv package to keep versions used in a
    document linked to the document
