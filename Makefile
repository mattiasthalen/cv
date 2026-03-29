.PHONY: cv

cv:
	uv run rendercv render mattias_thalen__cv.yaml
	cp "rendercv_output/Mattias_Thalén_CV.md" README.md
