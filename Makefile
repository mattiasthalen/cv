.PHONY: cv

cv:
	uv run rendercv render mattias_thalen__cv.yaml
	@echo '---' > index.md
	@echo 'layout: default' >> index.md
	@echo 'title: Mattias Thalén - Senior Data Engineer' >> index.md
	@echo '---' >> index.md
	@echo '' >> index.md
	@tail -n +9 "rendercv_output/Mattias_Thalén_CV.md" >> index.md
	@echo "index.md generated successfully"
