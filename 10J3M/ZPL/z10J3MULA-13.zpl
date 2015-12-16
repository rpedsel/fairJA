set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.0588, <2> 11.7431, <3> 13.7568, <4> 41.5837, <5> 42.372, <6> 9.5524, <7> 7.3461, <8> 34.0865, <9> 48.8558, <10> 25.013;
param workload[JOB] := <1> 326.1203, <2> 137.9004, <3> 189.2495, <4> 1729.2041, <5> 1795.3864, <6> 91.2483, <7> 53.9652, <8> 1161.8895, <9> 2386.8892, <10> 625.6502;
param capacity[MACHINE] := <1> 2832.501, <2> 2832.501, <3> 2832.501;

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
