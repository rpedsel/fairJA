set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.9023, <2> 18.7652, <3> 30.6373, <4> 26.3738, <5> 30.2926, <6> 25.9874, <7> 29.4514, <8> 23.9333, <9> 17.3479, <10> 13.8849, <11> 28.5902, <12> 32.0874, <13> 27.5306, <14> 23.2027, <15> 24.0764, <16> 23.0441, <17> 19.3679, <18> 21.0164, <19> 20.6927, <20> 24.5813;
param workload[JOB] := <1> 26.1728, <2> 15.1331, <3> 12.5468, <4> 28.2175, <5> 14.6756, <6> 4.4998, <7> 9.409, <8> 0.1176, <9> 4.742, <10> 7.5027, <11> 2.2782, <12> 40.1982, <13> 12.2715, <14> 10.6896, <15> 42.9202, <16> 16.7076, <17> 10.2019, <18> 32.7953, <19> 49.3597, <20> 48.153;
param capacity[MACHINE] := <1> 388.5921, <2> 388.5921, <3> 388.5921, <4> 388.5921, <5> 388.5921, <6> 388.5921;

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
