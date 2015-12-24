set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 44.679, <2> 27.068, <3> 34.8215, <4> 39.4606, <5> 30.6216, <6> 4.6236, <7> 3.7996, <8> 36.0811, <9> 43.8673, <10> 33.9909;
param workload[JOB] := <1> 6.6842, <2> 5.2027, <3> 5.901, <4> 6.2818, <5> 5.5337, <6> 2.1503, <7> 1.9493, <8> 6.0068, <9> 6.6232, <10> 5.8302;
param capacity[MACHINE] := <1> 13.0408, <2> 13.0408, <3> 13.0408;

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
