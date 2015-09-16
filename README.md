btform
=======

python web app forms tools

Code is extracted  from web.py

install 
=======

    easy_install btform

    pip install btform

example of flask 
=================

    #!/usr/bin/env python
    #coding:utf-8

    from flask import Flask
    from flask import request
    from btform import rules
    import btform as form
    
    app = Flask(__name__)

    form1 = form.Form(
        form.Textbox("name",rules.is_alphanum2(6,32),description=""),
        form.Password("passwd",rules.is_alphanum2(6,32),description=""),
        form.Textarea("desc",rules.len_of(1,128),description="",rows="5",),
        form.Button("submit", type="submit",html="<b>submit</b>"),
    )

    def render_form(frm):
        return "<form action='/' method='POST'>%s</form>"%frm.render()

    @app.route('/', methods=['POST', 'GET'])
    def hello_world():
        iform = form1()
        if request.method == 'GET':
            return render_form(iform)
        elif request.method == 'POST':
            if not iform.validates(source=request.form): 
                return render_form(iform)
            else:
                return "ok"  

    if __name__ == '__main__':
        app.run()