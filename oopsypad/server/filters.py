import json

def add_filters(app):

    @app.template_filter('tojson_pretty')
    def to_pretty_json(value):
        return json.dumps(value, sort_keys=True,
                        indent=4, separators=(',', ': '))

    @app.template_filter("normalizeFilename")
    def normalizeFilename(value):
        filename = "N/A"

        if isinstance(value, str) :
            filename = value.rsplit("/", 1)[1]

        return filename

    @app.template_filter("normalizeLine")
    def normalizeLine(frame):
        result = ""
        if frame.get("line"):
            result += ":" + str(frame["line"])

        return result
        
    @app.template_filter("normalizeFunctionName")
    def normalizeFunctionName(frame):
        ret = ""

        if frame.get("function"):
            ret = frame["function"]
        else:
            ret = "N/A"

        return ret