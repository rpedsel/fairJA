set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 45.1544, <2> 49.1614, <3> 44.8035, <4> 40.1687, <5> 13.9469, <6> 26.18, <7> 42.3149, <8> 4.5881, <9> 24.6573, <10> 5.0911;
param workload[JOB] := <1> 2038.9198, <2> 2416.8432, <3> 2007.3536, <4> 1613.5245, <5> 194.516, <6> 685.3924, <7> 1790.5508, <8> 21.0507, <9> 607.9824, <10> 25.9193;
param capacity[MACHINE] := <1> 11402.0527, <2> 11402.0527, <3> 11402.0527;

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
