Simple command that kills consecutive spaces, tabs and new line characters.
This will helpful when you writing lambda expresssions.
Some mode doesn't provide lambda expression and annoying spaces sometimes breed.

For example, when you want to write like this

	  hogehoge
	)}

but some modes indent like this
 
	 hogehoge
	)
	}
	
and some modes...

	  hogehoge
	)               }

Press "C-c ask" between ")" and "}" then that'll be ok.

## Installation

 put this file to where you want and add the following
 (setq load-path (cons "path-to-file" load-path))
 (require 'annoying-space-killer)
 (global-set-key "\C-cask" 'ask-kill

## Usage

 Press "C-c ask" then this kills consecutive spaces.
