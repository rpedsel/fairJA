set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 3.0776, <2> 48.7596, <3> 8.414, <4> 6.3475, <5> 2.271, <6> 17.3421, <7> 42.122, <8> 10.232, <9> 38.563, <10> 12.5855;
param workload[JOB] := <1> 9.4716, <2> 2377.4986, <3> 70.7954, <4> 40.2908, <5> 5.1574, <6> 300.7484, <7> 1774.2629, <8> 104.6938, <9> 1487.105, <10> 158.3948;
param capacity[MACHINE] := <1> 6328.4187, <2> 6328.4187, <3> 6328.4187;

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
