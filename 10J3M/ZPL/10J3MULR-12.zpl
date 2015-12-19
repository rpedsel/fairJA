set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.5702, <2> 39.7849, <3> 39.6333, <4> 37.2949, <5> 39.4859, <6> 2.1431, <7> 15.1592, <8> 29.986, <9> 22.2718, <10> 11.2381;
param workload[JOB] := <1> 6.4522, <2> 44.3207, <3> 46.595, <4> 13.3065, <5> 17.545, <6> 26.7549, <7> 7.2937, <8> 17.7739, <9> 44.7927, <10> 9.4436;
param capacity[MACHINE] := <1> 78.0927, <2> 78.0927, <3> 78.0927;

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
