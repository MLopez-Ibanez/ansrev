#                                                           -*- mode: cperl -*-
# https://www.overleaf.com/learn/how-to/Cross_referencing_with_the_xr_package_in_Overleaf
$bibtex = "bibtex -min-crossrefs=999 %O %S";
$pdflatex = "pdflatex --shell-escape -interaction=nonstopmode -cnf-line=extra_mem_top=12000000 -cnf-line=extra_mem_bot=12000000 -cnf-line=main_memory=12000000  %O %S";

# Options to supply to latexmk for compilation of external documents:
@sub_doc_options = ();
push @sub_doc_options, '-pdf'; # Use pdflatex for compilation of external documents.
# Replace '-pdf' by '-pdfdvi', 'pdfxe', or 'pdflua' if needed.

#--------------------

# Add a pattern for xr's log-file message about missing files to latexmk's
# list.  Latexmk's variable @file_not_found is not yet documented.
# This line isn't necessary for v. 4.80 or later of latexmk.
push @file_not_found, '^No file\\s*(.+)\s*$';

add_cus_dep( 'tex', 'aux', 0, 'makeexternaldocument' );

sub makeexternaldocument {
    if ( $root_filename ne $_[0] )  {
        my ($base_name, $path) = fileparse( $_[0] );
        pushd $path;
        my $return = system "latexmk",
                            @sub_doc_options,
                            $base_name;
        popd;
        return $return;
    }
}
