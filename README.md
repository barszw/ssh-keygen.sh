# What Is ssh-keygen.sh?
ssh-keygen.sh is a tool for creating new authentication key pairs for SSH. Such key pairs are used for automating logins, single sign-on, and for authenticating hosts.

# Make it executable
chmod +x ssh-keygen.sh

# Execute scripts
sh ssh-keygen.sh id_rsa_backup_via_ssh

#Setting permissions based on quotations from the manual pages (link at the end):
<div class="s-table-container">
<table class="s-table">
<thead>
<tr>
<th>Directory or File</th>
<th>Man Page</th>
<th>Recommended<br/>Permissions</th>
<th>Mandatory<br/>Permissions</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>~/.ssh/</code></td>
<td>There is no general requirement to keep the entire contents of this directory secret, but the recommended permissions are read/write/execute for the user, and not accessible by others.</td>
<td>700</td>
<td></td>
</tr>
<tr>
<td><code>~/.ssh/authorized_keys</code></td>
<td>This file is not highly sensitive, but the recommended permissions are read/write for the user, and not accessible by others</td>
<td>600</td>
<td></td>
</tr>
<tr>
<td><code>~/.ssh/config</code></td>
<td>Because of the potential for abuse, this file must have strict permissions: read/write for the user, and not writable by others.</td>
<td></td>
<td>600</td>
</tr>
<tr>
<td><code>~/.ssh/identity</code><br/><code>~/.ssh/id_dsa</code><br/><code>~/.ssh/id_rsa</code></td>
<td>These files contain sensitive data and should be readable by the user but not accessible by others (read/write/execute)</td>
<td></td>
<td>600</td>
</tr>
<tr>
<td><code>~/.ssh/identity.pub</code><br/><code>~/.ssh/id_dsa.pub</code><br/><code>~/.ssh/id_rsa.pub</code></td>
<td>Contains the public key for authentication.  These files are not sensitive and can (but need not) be readable by anyone.</td>
<td>644</td>
<td></td>
</tr>
</tbody>
</table>
</div>
<p>All the man page quotes are from <a href="http://linuxcommand.org/lc3_man_pages/ssh1.html" rel="noreferrer">http://linuxcommand.org/lc3_man_pages/ssh1.html</a></p>
