BEGIN { STOP="" }
function comment(s) { return s ~ /^# ?/ }

NR < 3 { next} 
sub(/^@of."/,"#") { sub(/"./,"") }
comment($0) && !comment(last) { printf STOP }
!comment($0) && comment(last) { print "\n```python"; STOP="```\n\n" }
END { if(!comment(last)) print STOP }
 { last = $0;
   sub(/^# ?/,"")
   print $0
 }
