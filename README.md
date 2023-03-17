# ansrev.sty: A LaTeX package for answering reviews.

## Features

 * Automatic numbering of reviewers and comments.

 * Customize the color of the answers.

 * Add labels to reviewer comments using `\label{goodcomment}`. A reference like `\ref{goodcomment}` will expand to something like `Reviewer 3 Comment #2`.

 * The answers can use `\cite{}` to cite references in the main file and the references will use the format and numbering of the bibliography of the main file. The answers do not need to load any bib files to achieve this.

 * The answers can use labels from the main file: If the main file contains `\label{fig1}`, then an answer can use `\ref{fig1}` and even `\pageref{fig1}` to refer to the main file.

 * If the main file loads the package [`revquote.sty`](https://github.com/MLopez-Ibanez/ansrev/blob/main/revquote.sty), then the main file can define text to quote like:
   ```latex
   \revquote{somelabel}{% We want to quote this.
   Something to quote in the answers.}
   ```
   and the answers can quote it like:
   ```latex
   A quote from Section~\ref{sec:somelabel} on page~\pageref{somelabel}:
   \revquotefrom{somelabel}
   ```
   The above will expand to the quoted text and it will mention the Section and page number where the quote is located in the main file.

See an example of a main file ([example-main.tex](https://github.com/MLopez-Ibanez/ansrev/blob/main/example-main.tex)) and of the answers to reviewers ([example-ansrev.tex](https://github.com/MLopez-Ibanez/ansrev/blob/main/example-ansrev.tex)).


## Options

  * `main`: Filename without `.tex` extension that contains the revised paper. Labels and references used in the main file will become available in the reply file. For the use of cross-references in [Overleaf](https://www.overleaf.com/learn/how-to/Cross_referencing_with_the_xr_package_in_Overleaf), the following should be added to a file `.latexmkrc` in the root folder:
  ```
  add_cus_dep( 'tex', 'aux', 0, 'makeexternaldocument' );
  sub makeexternaldocument {
      if (!($root_filename eq $_[0]))
      {
          # FOR PDFLATEX
          system( "latexmk -cd -pdf \"$_[0]\"" );
  
          # FOR LATEX+DVIPDF
          # system( "latexmk -cd \"$_[0]\"" );
  
          # FOR XELATEX
          # system( "latexmk -cd -xelatex \"$_[0]\"" );
        
          # FOR LUALATEX
          # system( "latexmk -cd -lualatex \"$_[0]\"" );
     }
  }
  ```
  
  * `anscolor=`: specify a color for the answers. The default is `anscolor=black`.
  * `hidebib=[true|false]`: whether to show or hide the bibliography in the reply document. The default is `hidebib=true`, which hides the bibliography (it already appears in the main file).
  
## Usage

This package defines several commands:

1. `\AssociateEditor` starts a section of comments by the associate editor.

2. `\Reviewer` starts a section of comments by a new reviewers. Reviewers are numbered automatically.

3. `\QA{comment-by-reviewer}{answer-to-the-comment}` for replying to reviewer's comments. The comments are numbered automatically. Labels created within the comment will reference the reviewer and comment number.

## revquote.sty

Defines the command:

```latex
\revquote{LABEL}{TEXT TO QUOTE}
```

where `LABEL` is a label similar to the one use for `\label{}` and `TEXT TO QUOTE` is some arbitrary text.

The quote can be used as:

```latex
\revquotefrom{LABEL}
```
