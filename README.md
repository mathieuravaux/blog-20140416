blog-20140416
=============

Blog 16 Apr, 2014

    docker build -t blog-20140416 .
    docker run -i -p 4000:4000 -t blog-20140416

    cd ~/src/github.com/dynamo/dynamo
    mix dynamo ~/src/github.com/pdericson/blog-20140416/blog
    cd ~/src/github.com/pdericson/blog-20140416
    rm blog/README.md; mv blog/.gitignore blog/* .; rmdir blog
