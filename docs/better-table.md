(NOTE: The table below will show incorrectly until `Pod::To::Markdown` has the capability to implement more Unicode symbols.)

<table class="pod-table">
<thead><tr>
<th>Name</th> <th>Formula</th> <th>Example</th> <th>Notes</th>
</tr></thead>
<tbody>
<tr> <td>frac</td> <td>x - E&lt;0x230a&gt;xE&lt;0x230b&gt;</td> <td>frac(-1.3): 0.7</td> <td>1</td> </tr> <tr> <td>afrac</td> <td>|x| - E&lt;0x230a&gt;|x|E&lt;0x230b&gt;</td> <td>afrac(-1.3): 0.3</td> <td>2</td> </tr> <tr> <td>ofrac</td> <td>x - E&lt;0x230a&gt;|x|E&lt;0x230b&gt;E&lt;0x22c5&gt;sign(x)</td> <td>ofrac(-1.3): -0.3</td> <td>3</td> </tr>
</tbody>
</table>

