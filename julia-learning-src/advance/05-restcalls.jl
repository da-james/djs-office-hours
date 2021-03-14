using HTTP
using JSON

function call(url)

    try
        response = HTTP.get(url)
        return JSON.parse(String(response.body))
    catch e
        return "ERROR: $e"
    end

end


function main()

    url = "https://cat-fact.herokuapp.com/facts/"

    r = call(url)

    println(r)
    println(keys(r[1]))
    println(r[1]["text"])

end

main()