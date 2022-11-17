report: "report/workflow.rst"
configfile: "config.yaml"

FILENAMES = ['A','B','C']
OUTDIR = config['out_dir']
print(OUTDIR)

rule all:
	input:
		expand("/Users/mhb8436/Workspaces/snake/test4/temp/{OUTDIR}/wc_all.png", OUTDIR=OUTDIR)

rule count:
	input:
		"/Users/mhb8436/Workspaces/snake/test4/data/{filename}.txt"
	output:
		"/Users/mhb8436/Workspaces/snake/test4/temp/{OUTDIR}/wc_{filename}.txt"
	shell:
		"wc -w {input} > {output}"

rule concat:
	input:
		expand('/Users/mhb8436/Workspaces/snake/test4/temp/{OUTDIR}/wc_{filename}.txt', filename=FILENAMES, OUTDIR=OUTDIR)
	output:
		expand("/Users/mhb8436/Workspaces/snake/test4/temp/{OUTDIR}/wc_all.csv", OUTDIR=OUTDIR)
	script:
		"/Users/mhb8436/Workspaces/snake/test4/concat.py"

rule plot:
	input:
		expand("/Users/mhb8436/Workspaces/snake/test4/temp/{OUTDIR}/wc_all.csv", OUTDIR=OUTDIR)
	output:
		expand("/Users/mhb8436/Workspaces/snake/test4/temp/{OUTDIR}/wc_all.png", OUTDIR=OUTDIR)
	script:
		"/Users/mhb8436/Workspaces/snake/test4/plot.py"

