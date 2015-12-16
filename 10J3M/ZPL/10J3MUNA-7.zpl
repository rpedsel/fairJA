set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.0416, <2> 17.1562, <3> 30.9236, <4> 11.9652, <5> 22.7454, <6> 48.445, <7> 39.1991, <8> 22.384, <9> 4.7087, <10> 5.6106;
param workload[JOB] := <1> 325.4993, <2> 294.3352, <3> 956.269, <4> 143.166, <5> 517.3532, <6> 2346.918, <7> 1536.5694, <8> 501.0435, <9> 22.1719, <10> 31.4788;
param capacity[MACHINE] := <1> 6674.8043, <2> 6674.8043, <3> 6674.8043;

var x[JM];
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
