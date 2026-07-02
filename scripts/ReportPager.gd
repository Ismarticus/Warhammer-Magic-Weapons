extends RichTextLabel
#rich text lable pager

#prints output to the attached rich text lable
func printsometext(message):
	#set_bbcode(message)
	add_text(message)

#prints a new line
func mknewline():
	newline()

#clears the text lable
func clearthistext():
	clear()
	
