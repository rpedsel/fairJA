set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 5.5122, <2> 32.7465, <3> 37.2777, <4> 7.2764, <5> 46.6379, <6> 44.1957, <7> 1.1294, <8> 34.3929, <9> 16.769, <10> 40.1006;
param workload[JOB] := <1> 30.3843, <2> 1072.3333, <3> 1389.6269, <4> 52.946, <5> 2175.0937, <6> 1953.2599, <7> 1.2755, <8> 1182.8716, <9> 281.1994, <10> 1608.0581;
param capacity[MACHINE] := <1> 3249.0162, <2> 3249.0162, <3> 3249.0162;

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
