CLEAN_FILES = laptop_* lakes_* *.out
RMD_FILE = hw7.Rmd
PANDOC_PATH := $(shell which pandoc)

.PHONY: clean render

test:
	Rscript --vanilla test.R

test_sbat:
	sbatch test.sbat

render_sbat:
	sbatch sim.sbat

clean:
	rm -rf $(CLEAN_FILES)
	@echo "Cleaned up: $(CLEAN_FILES)"

render:
	Rscript -e "Sys.setenv(RSTUDIO_PANDOC='$(PANDOC_PATH)'); rmarkdown::render('$(RMD_FILE)', output_format = 'html_document')"

pandoc_p:
	echo $(PANDOC_PATH)