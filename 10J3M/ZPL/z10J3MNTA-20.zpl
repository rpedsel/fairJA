set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.5545, <2> 30.8634, <3> 21.5522, <4> 28.789, <5> 27.3058, <6> 21.6094, <7> 21.9283, <8> 13.9668, <9> 26.4726, <10> 25.5006;
param workload[JOB] := <1> 602.9235, <2> 952.5495, <3> 464.4973, <4> 828.8065, <5> 745.6067, <6> 466.9662, <7> 480.8503, <8> 195.0715, <9> 700.7986, <10> 650.2806;
param capacity[MACHINE] := <1> 1522.0876, <2> 1522.0876, <3> 1522.0876;

var x[JM] binary;
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
