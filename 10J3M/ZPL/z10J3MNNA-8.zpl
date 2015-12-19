set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 15.9548, <2> 27.6292, <3> 30.9496, <4> 22.8877, <5> 20.6649, <6> 27.118, <7> 22.0821, <8> 27.6144, <9> 27.3123, <10> 29.0374;
param workload[JOB] := <1> 254.5556, <2> 763.3727, <3> 957.8777, <4> 523.8468, <5> 427.0381, <6> 735.3859, <7> 487.6191, <8> 762.5551, <9> 745.9617, <10> 843.1706;
param capacity[MACHINE] := <1> 6501.3833, <2> 6501.3833, <3> 6501.3833;

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
