set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.2389, <2> 23.3196, <3> 34.5195, <4> 17.2407, <5> 23.5065, <6> 25.1933, <7> 16.1639, <8> 23.5891, <9> 30.5748, <10> 27.5306;
param workload[JOB] := <1> 975.8689, <2> 543.8037, <3> 1191.5959, <4> 297.2417, <5> 552.5555, <6> 634.7024, <7> 261.2717, <8> 556.4456, <9> 934.8184, <10> 757.9339;
param capacity[MACHINE] := <1> 1676.5595, <2> 1676.5595, <3> 1676.5595;

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
