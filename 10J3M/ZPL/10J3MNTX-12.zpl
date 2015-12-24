set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.3641, <2> 16.9377, <3> 25.6196, <4> 19.5092, <5> 22.4948, <6> 18.8239, <7> 28.5152, <8> 21.6527, <9> 25.8109, <10> 24.091;
param workload[JOB] := <1> 5.6004, <2> 4.1155, <3> 5.0616, <4> 4.4169, <5> 4.7429, <6> 4.3387, <7> 5.34, <8> 4.6532, <9> 5.0804, <10> 4.9083;
param capacity[MACHINE] := <1> 12.0645, <2> 12.0645, <3> 12.0645;

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
