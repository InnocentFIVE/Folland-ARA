
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ARA}


\LoadClass[twoside, fontset=fandol, punct=kaiming]{ctexbook}
\RequirePackage[svgnames]{xcolor}
\RequirePackage{graphicx}
\RequirePackage[b5paper]{geometry}
\RequirePackage[scr=boondox]{mathalpha}
\RequirePackage{amsmath,amsfonts,amssymb,amsthm,euscript,fontspec,tocloft,fancyhdr,mathtools,enumitem,pgfplots,tikz-cd,xeCJKfntef,xeCJK}
\xeCJKsetup{CheckSingle = true}
\RequirePackage{tikz}
\usetikzlibrary{calc}
\RequirePackage{fixdif}
\RequirePackage[
    colorlinks,
    linkcolor = DarkTurquoise!60!black,
    anchorcolor = OrangeRed,
    filecolor = OrangeRed,
    urlcolor = OrangeRed,
    citecolor = Teal,
    linktocpage,
    hyperfootnotes = true,
    breaklinks = true,
]{hyperref}

% Font settings

\setmainfont{lmroman10-regular.otf}[
    BoldFont = lmromandemi10-regular.otf,
    ItalicFont = lmroman10-italic.otf,
    SizeFeatures = {
        {Size = {-9}, Font = lmroman8-regular.otf},
        {Size = {9-14}, Font = lmroman10-regular.otf},
        {Size = {14-}, Font = lmroman17-regular.otf}
    } 
]
\setCJKmainfont{FandolSong-Regular.otf}[
    BoldFont = FandolSong-Bold.otf,
    ItalicFont = FandolKai-Regular.otf,
    SizeFeatures={
        {Size={-9}, FakeStretch = 1.05, ItalicFont = FandolKai-Regular.otf},
        {Size={9-}, FakeStretch = 1, ItalicFont = FandolKai-Regular.otf}
    } 
]

% Layout settings

\renewcommand{\sectionmark}[1]{\markright {\uppercase{#1}}}
\fancypagestyle{fancy}
{    
    \fancyhead[OR]{\fontspec{lmsansquot8-oblique.otf}[FakeStretch=.85]\itshape\small\rightmark\qquad{\fontspec{lmsans10-boldoblique.otf}\thepage}}
    \fancyhead[LE]{\fontspec{lmsansquot8-oblique.otf}[FakeStretch=.85]\itshape\small{\fontspec{lmsans10-boldoblique.otf}\thepage}\qquad\leftmark}
    \fancyhead[LO,RE]{}
    \fancyfoot[C]{}
    \renewcommand{\headrulewidth}{0pt}
}
\pagestyle{fancy}

% Something about mathemathics

\renewcommand\implies{\DOTSB \,\Longrightarrow \,}
\renewcommand\setminus{\,\mathord{\mathchar"226E}\,}
\renewcommand\mathcal[1]{\EuScript{#1}}
\DeclareMathOperator{\dom}{dom}
\newcommand\dif{\mathrel{\triangle}}

% Defining environments

\newtheoremstyle{innocent}{}{}
{\rmfamily\kaishu}{}
{\sffamily\bfseries}{}
{ }{\thmname{#1}\thmnumber{ #2}\,\mdseries\rmfamily\thmnote{$\left(\,\mbox{#3}\,\right) $}.~}
\theoremstyle{innocent}
\newtheorem*{theorem}{定理}
\renewenvironment{quote}{\begin{flushright}\small\kaishu\begin{minipage}{15em}}{\end{minipage}\end{flushright}\medskip}

% About footnotes

\newlength \circlenumbertemp
\newlength \squarenumbertemp
\newcommand {\circlenumber} [1] {%
    \ifnum #1 > 9
        \circlenumbertemp = 0.18cm
    \else
        \circlenumbertemp = 0.12cm
    \fi
    \hbox{\begin{tikzpicture}[baseline = -.8ex]
        \draw [line width = .3pt] (0,0) circle (0.12);
        \node at(0,0){\makebox[0pt]{\resizebox{\circlenumbertemp}{!}{\textbf{#1}}}};
    \end{tikzpicture}}
}
\newcommand {\squarenumber} [1] {%
    \ifnum #1 > 9
        \squarenumbertemp = 0.18cm
    \else
        \squarenumbertemp = 0.12cm
    \fi
    \hbox{\begin{tikzpicture}[baseline = -.7ex]
        \draw [line width = .3pt, rounded corners = 1pt] (-0.12,-0.12) rectangle (0.12,0.12);
        \node at(0,0){\makebox[0pt]{\resizebox{\squarenumbertemp}{!}{\textbf{#1}}}};
    \end{tikzpicture}}
}
\renewcommand\@makefnmark{\@textsuperscript{\scalebox{.8}{\circlenumber{\@thefnmark}}}}
\renewcommand\@makefntext[1]{%
  \hspace*{-2em}%
  \parindent 2em%
  \noindent
  \hb@xt@ 2em{\hss
  \normalfont
  \scalebox{1}[.9]{\circlenumber{\@thefnmark}}~}%
  #1}

% ctex settings

\renewcommand \cleardoublepage{\clearpage \if@twoside \ifodd \c@page \else \hbox {\thispagestyle{empty}}\newpage \if@twocolumn \hbox {\thispagestyle{empty}}\newpage \fi \fi \fi}
\ctexset{
    chapter = { 
        numbering = false,
        name = {章,},
        beforeskip = 1em,
        format = \Large\bfseries$\triangleright~$,
        pagestyle = fancy,
        break = \if@openright\cleardoublepage\else\clearpage\fi
    },
	section = {
	  name = {,},
	  number = \chinese{section},
	  format = \large\bfseries,
	 }
}

% Defining colors

\definecolor{titlegreendark}{HTML}{C1C998}