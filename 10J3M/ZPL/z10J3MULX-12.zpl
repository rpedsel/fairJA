set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 3.0631, <2> 43.8796, <3> 24.0087, <4> 17.083, <5> 16.3534, <6> 34.3731, <7> 24.2104, <8> 33.901, <9> 32.6387, <10> 35.2522;
param workload[JOB] := <1> 1.7502, <2> 6.6242, <3> 4.8999, <4> 4.1332, <5> 4.0439, <6> 5.8629, <7> 4.9204, <8> 5.8225, <9> 5.713, <10> 5.9374;
param capacity[MACHINE] := <1> 16.5692, <2> 16.5692, <3> 16.5692;

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
