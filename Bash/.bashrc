# GIT

# Show file status
alias gs="git s"
# Add all files
alias ga="git a"
# Commit all changes
alias gc="git c"
# Add and Commit all changes
alias gac="git ac"
# Remove cache 
alias gcch="git cch"
# Open .gitconfig global file
alias gf="git file"


# SCALA

# Create scala worksheet
function snw() { 
  echo "println(\"WorkSheet created!\")" >> $1.worksheet.sc 
}