# ansrev.sty: A LaTeX package for answering reviews.

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

3. `\QA{comment-by-reviewer}{answer-to-the-comment}` for replying to reviewer's comments. The comments are numbered automatically. Labels created within the comment will reference the comment number.


Pull requests are welcome.
