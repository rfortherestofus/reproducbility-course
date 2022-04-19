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

### Lesson 2: Course logistics

-   Technical requirements, prior knowledge expectations (expect
    familiarity with R coding especially tidyverse for data management
    and visualization)
-   Course overview and recommendations (use RStudio)
-   Walk through of zip file containing R code file, codebook, data, R
    Project

[Provide zip file of code, codebook, data, R Project. Data and codebook
are publicly available 2019 SPSS data file and Word document codebook
from Pew on internet use by teenagers.]

## Part I: Writing reproducible code

### Lesson 3: Using space wisely

-   Introduce rationale for using white space
-   Discuss the 80 character rule, spaces before and after operators,
    hard returns after commas and other strategies for making code
    readable
-   Introduce tools for automatically checking and restyling code:
    [styler](https://styler.r-lib.org) and
    [lintr](https://github.com/r-lib/lintr)
-   Demo: fix spacing in provided R code file
-   Exercise: fix spacing in provided R code file
-   Resources:
    -   [Google’s R Style
        Guide](https://google.github.io/styleguide/Rguide.xml)

    -   [The tidyverse style guide](https://style.tidyverse.org)

    -   [The Art of Readable
        Code](http://shop.oreilly.com/product/9780596802301.do) by
        Boswell & Foucher

### Lesson 4: Naming things

-   Introduce recommendations and rationale for using human (and
    machine) readable naming
-   Formatting names consistently using camel case, dot case, snake
    case, upper camel case, and Pascal case
-   Following existing guidance for formatting names
-   Tidyverse refresher of rename and mutate/recode_factor
-   Demo: clean up names in provided R code file
-   Exercise: clean up names in provided R code file

### Lesson 5: Using function arguments

-   Introduce recommendations and rationale for using function arguments
-   Discuss argument ordering
-   Demo: add function arguments in provided R code file
-   Exercise: add function arguments in provided R code file

### Lesson 6: Prolog & Annotation

-   Introduce recommendations and rationale for annotation and prolog
-   Discuss pros and cons of annotation (some suggest it makes work less
    reproducible since often not updated)
-   Demo: add annotation and prolog to provided R code file
-   Exercise: add annotation and prolog to provided R code file

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
